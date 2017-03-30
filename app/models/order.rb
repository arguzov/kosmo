class Order < ActiveRecord::Base
    STATUSES = {1=>'Открытый',2=>'Перезвонить',3=>'Удачно',4=>'Неудачно',5=>'Архив'}
    TYPES = {1=>'Услуга',2=>'Магазин',3=>'Сертификат',4=>'Сертификат'}
    belongs_to :user
    belongs_to :manager, class_name: "User", :foreign_key => 'manager_id'
    belongs_to :filial

    scope :requests, -> {where('fl_status < 9')}
    scope :certificates, -> {where('fl_status = 9')}

    def order_type
        Order::TYPES[self.fl_type]
    end
end
