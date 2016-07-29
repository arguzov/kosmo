class Manager::Shop::ProductsController < Manager::ShopController
    before_action :get_product, only: [:edit,:update]

    def index
        if params[:category_id] != nil
            ids = ShopProduct.where('category_id = ?',params[:category_id]).pluck(:id)
            @products = ShopProductItem.where('product_id IN (?)',ids)
        else
            @products = ShopProductItem.all.order('id DESC')
        end
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
            product = @item.product
            if product.items.active.count < 2 && params[:value].to_i == 0
                product.fl_show = 0
                product.save
            end
            if params[:value].to_i == 1
                product.fl_show = 1
                product.save
            end
        elsif params[:name] == 'fl_best_seller'
            @item = ShopProductItem.find(params[:id])
            @item.fl_best_seller = params[:value]
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
