class Collection < ActiveRecord::Base
    has_many :products
    belongs_to :unit
end
