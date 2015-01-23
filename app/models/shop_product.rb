class ShopProduct < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    belongs_to :shop_category, :foreign_key => :category_id, :primary_key => :id
    has_many :shop_product_items, :primary_key => :id, :foreign_key => :product_id

    def prices
        return self.shop_product_items.minimum(:price)
    end

    def collection
        return self.shop_category
    end

    def items
        return self.shop_product_items
    end

    def parent_id
        return self.category_id
    end
end
