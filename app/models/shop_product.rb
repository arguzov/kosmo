class ShopProduct < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "180x180>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    belongs_to :shop_category, :foreign_key => :category_id, :primary_key => :id
    has_many :shop_product_items, :primary_key => :id, :foreign_key => :product_id

    scope :active, -> {where('fl_show = 1')}

    def prices
        self.shop_product_items.minimum(:price)
    end

    def collection
        self.shop_category
    end

    def items
        self.shop_product_items
    end

    def parent_id
        self.category_id
    end
end
