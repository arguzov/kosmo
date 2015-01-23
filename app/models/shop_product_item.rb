class ShopProductItem < ActiveRecord::Base
    UNITS = {1=>'шт',2=>'мл',3=>'гр'}
    belongs_to :shop_product, :foreign_key => :product_id, :primary_key => :id

    def unit_name
        return ShopProductItem::UNITS[self.unit]
    end

    def product
        self.shop_product
    end
end
