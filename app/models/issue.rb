class Issue < ActiveRecord::Base
    has_and_belongs_to_many :services
    accepts_nested_attributes_for :services, allow_destroy: true
end
