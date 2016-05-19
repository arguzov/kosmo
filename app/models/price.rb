class Price < ActiveRecord::Base
    belongs_to :service
    scope :with_price, -> {where('parent_id > 0')}
    scope :first_level, -> {where('parent_id = 0')}
end
