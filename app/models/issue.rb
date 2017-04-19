class Issue < ActiveRecord::Base
    has_and_belongs_to_many :services
    has_and_belongs_to_many :shop_products, :foreign_key => :issue_id, :association_foreign_key => :product_id
    accepts_nested_attributes_for :services, allow_destroy: true
end
