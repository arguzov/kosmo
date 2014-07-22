class OrdersController < ApplicationController

    def create
        params = order_params
        all_count = params[:content].length
        if all_count > 5
            lat_count = params[:content].gsub(/[^a-zA-Z]+/,'').length
            if lat_count.to_f/all_count.to_f > 0.5
                return render text: 'You order has been created'
            end
        end
        @order = Order.new(params)
        respond_to do |format|
            if @order.save
                OrderMailer.recall(params).deliver
                format.html { redirect_to :back, notice: 'Order was created' }
                format.json { render json: @order }
            else
                format.html { render action: 'new' }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def order_params
        params.require(:order).permit(:contacts, :content)
    end
end
