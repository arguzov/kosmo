class ShopController < ApplicationController
    layout 'shop'

    def collection
        @collection = Collection.where('url = ?',params[:url]).first
        @products = Product.where('collection_id = ?',@collection[:id])
    end

    def product
        @product = Product.where('url = ?',params[:url]).first
    end
end
