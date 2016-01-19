ActiveAdmin.register Widget do

  permit_params :header, :position_id, :content, :entity_id

  index do
      column :id
      column :entity_id
      column :position
      column :header
      default_actions
  end

  form do |f|
      f.inputs "Данные виджета" do
          f.input :header
          f.input :content, input_html: {class: "redactor" }
          f.input :position_id, :label => 'Позиция', :as => :select, :collection => Widget::POSITIONS.invert, :prompt => '--'
          f.input :entity_id
      end
      f.actions
  end


end
