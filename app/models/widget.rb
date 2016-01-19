class Widget < ActiveRecord::Base
    POSITIONS = {1=>'Сервис: лучшие цены',2=>'Сервис: перед прайсом'}
    scope :pos, -> (position) {where('position_id = ?',position)}

    def position
        Widget::POSITIONS[self.position_id]
    end
end
