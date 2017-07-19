class Video < ActiveRecord::Base
    belongs_to :service
    scope :onpage, -> {where('is_show_on_service_page = 1')}
end
