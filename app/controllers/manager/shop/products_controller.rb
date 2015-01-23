class Manager::Shop::ProductsController < Manager::ShopController
    before_action :get_product, only: [:edit,:update]

    def index
        @products = ShopProduct.all
    end

    private

    def get_product
        @product = ShopProduct.find(params[:id])
    end

    def product_params
        params.require(:shop_product).permit(:name, :url, :fl_show, :description, :category_id, :photo, :price)
    end
end
