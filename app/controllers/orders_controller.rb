class OrdersController < ApplicationController
    #dsfsdf

    def kassa
        @order = Order.find(params[:id])
    end

    def complete

    end

    def create
        if params[:order][:email].length > 0
            return render text: 'Форма отправлена'
        end

        @params = order_params
        all_count = @params[:content].length

        if @params.has_key?('fl_type') == false
            @params[:fl_type] = 1
        end
        if @params[:fl_type] == 1 && all_count > 5
            lat_count = @params[:content].gsub(/[^a-zA-Z]+/,'').length
            if lat_count.to_f/all_count.to_f > 0.5
                return render text: 'You order has been created'
            end
        end
        @order = Order.new(@params)
        @order.fl_type = @params[:fl_type]
        if @params[:fl_type] == '2'
            shop_order
        elsif @params[:fl_type] == '3' || @params[:fl_type] == '4'
            @order.fl_status = 9
        else
        end
        respond_to do |format|
            if @order.save
                if @params[:fl_type] == '2'
                    data = {
                        user_name: @order.user.name,
                        user_email: @order.user.email,
                        content: @order.content,
                        qty: @order.qty,
                        price: @order.price,
                        comment: @params[:content]
                    }
                    OrderMailer.shop(data).deliver
                elsif @params[:fl_type] == '3' || @params[:fl_type] == '4'
                    return redirect_to("/orders/kassa/#{@order.id}")
                else
                    OrderMailer.recall(@params).deliver
                end
                format.html { redirect_to :back, notice: 'Order was created' }
                format.json { render json: @order }
            else
                format.html { render action: 'new' }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        data = {
            contacts: @order.contacts,
            content: @order.content,
            price: @order.price
        }
        OrderMailer.certificate(data).deliver
        redirect_to '/orders/complete'
    end

    private
    def order_params
        params.require(:order).permit(:contacts, :content, :fl_type, :url, :price, :fl_status, :email_address, :filial_id)
    end

    def shop_order
        if current_user == nil
            users = User.where('email = ?',@params[:contacts])
            if users.count > 0
                user = users.first
            else
                generated_password = Devise.friendly_token.first(8)
                user = User.create!(:email => @params[:contacts], :password => generated_password, :phone => @params[:phone], :name => @params[:name])
            end
        else
            user = current_user
        end
        @order.user_id = user.id
        ids = cookies[:cart].split(/,/)
        items = ShopProductItem.where('id IN (?)',ids)
        content = "Сделан заказ в интернет магазине\n\n"
        price = 0
        items.each do |item|
            content = content + "- (#{item.id}) #{item.product.name} #{item.volume}: #{item.price} руб.\n"
            price = price + (item.price.to_i - (item.price.to_i*user.discount.to_i)/100).to_f.round
        end
        @order.content = content
        @order.items = cookies[:cart]
        @order.qty = items.count
        @order.price = price
    end
end
