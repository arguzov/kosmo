class Manager::PricesController < ApplicationController
    layout 'manager'
    before_action :authenticate_user!
    before_action :set_price, only: [:show, :create]

    def index
        #@prices = Price.order('service_id')
        @services = Service.all
    end

    def new
        @price = Price.new
        @price.service_id = params[:service_id]
    end

    def show

    end

    # PATCH/PUT /manager/orders/1
    # PATCH/PUT /manager/orders/1.json
    def create
        if params[:field]
            if params[:field] == 'price'
                @price.price = params[:value]
            end
            if params[:field] == 'discount'
                @price.discount = params[:value]
            end
            if params[:field] == 'is_new_only'
                @price.is_new_only = params[:value]
            end
            @price.save
            render json: {price: 'ok'}
        else
            Price.create(price_params)
            redirect_to manager_prices_path
        end
    end

    def destroy
        Price.find(params[:id]).destroy
        redirect_to manager_prices_path
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
        if params[:field]
        @price = Price.find(params[:id])
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_params
        params.require(:price).permit(:price, :name, :service_id, :parent_id, :discount, :is_new_only)
    end

end
