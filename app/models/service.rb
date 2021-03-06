class Service < ActiveRecord::Base
    has_attached_file :photo, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
    has_many :medicaments
    has_many :faqs
    has_and_belongs_to_many :sections
    has_and_belongs_to_many :issues
    has_and_belongs_to_many :posts
    has_and_belongs_to_many :experts
    has_and_belongs_to_many :promos
    has_and_belongs_to_many :certificates
    has_and_belongs_to_many :filials
    has_and_belongs_to_many :blocks
    has_and_belongs_to_many :shop_products, :foreign_key => :service_id, :association_foreign_key => :product_id
    accepts_nested_attributes_for :issues, allow_destroy: true
    accepts_nested_attributes_for :experts, allow_destroy: true
    accepts_nested_attributes_for :promos, allow_destroy: true
    has_many :prices
    has_many :discounts
    has_many :videos
    has_many :photos
    def self.for_select
        self.where('parent_id = 0').map{|c| ["#{c.name}", c.id]}.unshift(["Выбрать",0])
    end

    def first_level_prices
        self.prices.first_level
    end

    def reviews
        self.posts.where('category_id = 31')
    end
end
