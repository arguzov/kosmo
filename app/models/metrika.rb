class Metrika < ActiveRecord::Base
    ACTIONS = {1=>'Просмотры',2=>'Записаться',3=>'Цены',4=>'Виджет',5=>'Запись из цен'}
    belongs_to :service
end
