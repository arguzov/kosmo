ActiveAdmin.register Widget do
  menu label: "Виджеты"

  permit_params :header, :position_id, :content, :entity_id, :is_new, :is_only

  index do
      column :id
      column :entity_id
      column :position
      column :header
      column :is_new
      column :is_only
      actions
  end

  form do |f|
      f.inputs "Данные виджета" do
          f.input :header
          f.input :content, input_html: {class: "redactor" }
          f.input :position_id, :label => 'Позиция', :as => :select, :collection => Widget::POSITIONS.invert, :prompt => '--'
          f.input :entity_id
          f.input :is_new
          f.input :is_only
      end
      f.actions
  end


end
