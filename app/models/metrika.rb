class Metrika < ActiveRecord::Base
    ACTIONS = {1=>'Просмотры',2=>'Нижняя кнопка',3=>'Правая кнопка',4=>'Виджет'}
    belongs_to :service
end
