class Manager::PricesController < ApplicationController
    layout 'manager'
    before_action :authenticate_user!
    before_action :set_price, only: [:show, :create]

    def index
        #@prices = Price.order('service_id')
        if params[:service_id]
            @services = Service.where('id = ?',params[:service_id])
        else
            @services = Service.all
        end
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
            if params[:field] == 'name'
                @price.name = params[:value]
            end
            if params[:field] == 'discount'
                @price.discount = params[:value]
            end
            if params[:field] == 'is_new_only'
                @price.is_new_only = params[:value]
            end
            if params[:field] == 'gender_id'
                @price.gender_id = params[:value]
            end
            @price.save
            render json: {price: 'ok'}
        else
            price_row = Price.create(price_params)
            redirect_to manager_prices_path({service_id: price_row.service_id})
        end
    end

    def destroy
        price_row = Price.find(params[:id])
        service_id = price_row.service_id
        price_row.destroy
        Price.where('parent_id = ?',params[:id]).update_all(parent_id: 0)
        redirect_to manager_prices_path({service_id: service_id})
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
        if params[:price][:parent_id].nil? || params[:price][:parent_id].empty?
            params[:price][:parent_id] = 0
        end
        if params[:price][:price].nil? || params[:price][:price].empty?
            params[:price][:price] = 0
        end
        params.require(:price).permit(:price, :name, :service_id, :parent_id, :discount, :is_new_only, :gender_id)
    end

end
