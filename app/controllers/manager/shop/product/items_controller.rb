class Manager::Shop::Product::ItemsController < Manager::ShopController
    def create
        if params.has_key?(:volume)
            @item = ShopProductItem.new
            @item.product_id = params[:product_id]
            @item.volume = params[:volume]
            @item.price = params[:price]
            @item.color = params[:color]
            @item.unit = params[:unit]
            @item.save
            return render json: {:status=>'ok'}
        else

        end
    end

    def update
        if params.has_key?(:volume)
            @item = ShopProductItem.find(params[:id])
            @item.volume = params[:volume]
            @item.price = params[:price]
            @item.color = params[:color]
            @item.unit = params[:unit]
            @item.save
            return render json: {:status=>'ok'}
        else
            if @product.update(product_params)
                redirect_to :back
            else
                return render json: @product.errors
            end
        end
    end

    def destroy
        @item = ShopProductItem.find(params[:id])
        @product = ShopProduct.find(@item.product_id)
        @item.destroy
        if @product.items.count < 2
            @product.destroy
        end
        redirect_to :back
    end
end
