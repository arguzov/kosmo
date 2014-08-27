class ShopController < ApplicationController
    layout :resolve_layout

    def collection
        @collection = Collection.where('url = ?',params[:url]).first
        @products = Product.where('collection_id = ?',@collection[:id])
    end

    def product
        @product = Product.where('url = ?',params[:url]).first
    end

    def unit
        @unit = Unit.where('url = ?',params[:url]).first
        @collections = Collection.where('unit_id = ?',@unit.id)
        @products = Product.where('collection_id IN (?)',@collections.map{|row| row.id}).order('RAND()')
    end

    def cart
        if cookies.has_key?('cart')
            ids = cookies[:cart].split(/,/)
            @items = Item.where('id IN (?)',ids)
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
        @items = Item.where('id IN (?)',ids)
    end

    def cart_data
        cart_products = []
        viewed_products = []
        if cookies.has_key?('cart')
            ids = cookies[:cart].split(/,/)
            items = Item.where('id IN (?)',ids)
            items.each do |item|
                cart_products.push({:name=>item.product.name, :url=>item.product.url, :price=>item.price, :id=>item.product.id})
            end
        end
        if cookies.has_key?('viewed')
            ids = cookies[:viewed].split(/,/)
            items = Item.where('id IN (?)',ids)
            items.each do |item|
                viewed_products.push({:name=>item.product.name, :url=>item.product.url, :price=>item.price, :id=>item.product.id})
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
