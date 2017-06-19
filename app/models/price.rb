class Price < ActiveRecord::Base
    belongs_to :service
    has_many :discounts
    scope :with_price, -> {where('parent_id > 0')}
    scope :first_level, -> {where('parent_id = 0')}

    def parent_prices
        Price.where('service_id = ? AND parent_id = 0 AND price = 0',self.service_id)
    end
end
