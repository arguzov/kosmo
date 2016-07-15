class ShopProductItem < ActiveRecord::Base
    UNITS = {1=>'шт',2=>'мл',3=>'гр'}
    belongs_to :shop_product, :foreign_key => :product_id, :primary_key => :id

    scope :active, -> {where('fl_show = 1')}

    def unit_name
        ShopProductItem::UNITS[self.unit]
    end

    def product
        self.shop_product
    end
end
