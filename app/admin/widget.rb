ActiveAdmin.register Widget do
  menu :if => proc{ current_user.id < 5 }, label: "Виджеты"

  permit_params :header, :position_id, :content, :entity_id, :is_new, :is_only, :button_name, :metrika_id, :due_date

  index do
      column :id
      column :entity_id
      column :position
      column :header
      column :is_new
      column :is_only
      column :due_date
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
          f.input :button_name
          f.input :due_date, :label => 'Дата окончания'
          f.input :metrika_id
      end
      f.actions
  end


end
