class Widget < ActiveRecord::Base
    POSITIONS = {1=>'Сервис: лучшие цены',2=>'Сервис: перед прайсом',3=>'Сервис: спец предложение'}
    scope :pos, -> (position) {where('position_id = ?',position)}
    scope :entity, -> (entity_id) {where('entity_id = ?',entity_id)}

    def position
        Widget::POSITIONS[self.position_id]
    end
end
