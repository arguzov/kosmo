class ShopController < ApplicationController
    layout :resolve_layout
    #before_action :closed
    before_action :authenticate_user!, :only => [:orders,:order]

    def closed
        return render 'shop/closed'
    end

    def collection
        @collection = ShopCategory.where('url = ?',params[:url]).first
        @products = ShopProduct.active.where('category_id = ?',@collection[:id])
        @unit = ShopCategory.where('parent_id = ?',@collection.id)
    end

    def product
        @product = ShopProduct.active.where('url = ?',params[:url]).first
        @unit = @product.shop_category
        if cookies.has_key?('viewed')
            ids = cookies[:viewed].split(/,/)
            if !ids.include?(@product.id)
                ids = ids[0..9]
                ids.unshift(@product.id)
            end
            cookies[:viewed] = ids.join(',')
        else
            cookies[:viewed] = [@product.id]
        end
    end

    def unit
        @unit = ShopCategory.where('url = ?',params[:url]).first
        @collections = ShopCategory.where('parent_id = ?',@unit.id)
        @products = ShopProduct.active.where('parent_id IN (?)',@collections.map{|row| row.id}).order('RAND()')
    end

    def cart
        if cookies.has_key?('cart')
            ids = cookies[:cart].split(/,/)
            @items = ShopProductItem.where('id IN (?)',ids)
        else
            @items = []
        end
    end

    def orders
        @orders = Order.where('user_id = ?',current_user.id)
    end

    def order
        @order = Order.find(params[:id])
        ids = @order.items.split(/,/)
        @items = ShopProductItem.where('id IN (?)',ids)
    end

    def cart_data
        cart_products = []
        viewed_products = []
        if cookies.has_key?('cart')
            ids = cookies[:cart].split(/,/)
            items = ShopProductItem.where('id IN (?)',ids)
            items.each do |item|
                product = item.product
                if product.photo.exists?
                    photo_url = product.photo.url(:thumb)
                else
                    photo_url = "/data/products/#{product.id}.jpg"
                end
                cart_products.push({:name=>product.name, :url=>product.url, :photo_url=>photo_url, :price=>item.price, :id=>product.id})
            end
        end
        if cookies.has_key?('viewed')
            ids = cookies[:viewed].split(/,/)
            items = ShopProduct.where('id IN (?)',ids)
            items.each do |item|
                if item.photo.exists?
                    photo_url = item.photo.url(:thumb)
                else
                    photo_url = "/data/products/#{item.id}.jpg"
                end
                viewed_products.push({:name=>item.name, :url=>item.url, :photo_url=>photo_url, :price=>0, :id=>item.id})
            end
        end
        return render json: {:cart=>cart_products,:viewed=>viewed_products}
    end

    private
    def resolve_layout
        case action_name
            when 'order'
                'private'
            when 'orders'
                'private'
            when 'cart'
                'private'
            else
                'shop'
        end
    end
end
