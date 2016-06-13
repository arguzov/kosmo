class Manager::OrdersController < ApplicationController
    layout 'manager'
    before_action :set_order, only: [:show, :update]
    before_action :authenticate_user!

    def index
        @orders = Order.order('fl_status ASC, id DESC').paginate(:page => params[:page], :per_page => 20)
    end

    def show

    end

    # PATCH/PUT /manager/orders/1
    # PATCH/PUT /manager/orders/1.json
    def update
            @order.manager_id = current_user.id
            if @order.update(order_params)
                return render json: @order
            else
                return render json: @order.errors
            end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
        @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
        params.require(:order).permit(:user_id, :fl_status, :comment)
    end

end
