class Manager::Shop::ProductsController < Manager::ShopController
    before_action :get_product, only: [:edit,:update]

    def index
        @products = ShopProductItem.all.order('id DESC')
    end

    def new
        @product = ShopProduct.new
    end

    def update
        if @product.update(product_params)
            redirect_to :back
        else
            render json: @product.errors
        end
    end

    def update_field

        if params[:name] == 'fl_show'
            @item = ShopProductItem.find(params[:id])
            @item.fl_show = params[:value]
        elsif params[:name] == 'category_id'
            @item = ShopProduct.find(params[:id])
            @item.category_id = params[:value]
        elsif params[:name] == 'price'
            @item = ShopProductItem.find(params[:id])
            @item.price = params[:value]
        end
        @item.save
        render json: {:status=>'ok'}
    end

    def destroy
       ShopProduct.find(params[:id]).destroy
    end

    private

    def get_product
        @product = ShopProduct.find(params[:id])
    end

    def product_params
        params.require(:shop_product).permit(:name, :url, :fl_show, :description, :category_id, :photo, :price)
    end
end
