class Order < ActiveRecord::Base
    STATUSES = {1=>'Открытый',2=>'Перезвонить',3=>'Удачно',4=>'Неудачно',5=>'Архив'}
    belongs_to :user
    belongs_to :manager, class_name: "User", :foreign_key => 'manager_id'

    scope :requests, -> {where('fl_status < 9')}
    scope :certificates, -> {where('fl_status = 9')}
end
