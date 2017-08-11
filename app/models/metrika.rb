class Metrika < ActiveRecord::Base
    ACTIONS = {1=>'Просмотры',2=>'Записаться',3=>'Цены',4=>'Клики из виджета',5=>'Запись из цен',6=>'Показы виджета'}
    belongs_to :service
end
