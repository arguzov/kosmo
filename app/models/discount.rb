class Discount < ActiveRecord::Base
    UNITS = {1=>'Процентов',2=>'Рублей'}
    belongs_to :service
    belongs_to :promo
    belongs_to :price

    scope :alive, -> {where('due_date > ?',Date.today)}
end
