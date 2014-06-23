class OrdersController < ApplicationController

    def create
        @order = Order.new(order_params)
        respond_to do |format|
            if @order.save
                OrderMailer.recall(params[:order]).deliver
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
