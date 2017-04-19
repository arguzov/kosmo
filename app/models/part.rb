class Part < ActiveRecord::Base
    has_and_belongs_to_many :shop_products, :foreign_key => :part_id, :association_foreign_key => :product_id
end
