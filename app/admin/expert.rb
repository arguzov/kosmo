ActiveAdmin.register Expert do
    menu :if => proc{ current_user.id < 5 }, label: "Персонал"

  permit_params :name, :content, :profession, :photo, :education, :experience, :diploma, :fl_order, :role_id, service_ids: []

  index do
      column :id
      column :name
      column :profession
      column :fl_order
      column :role
      column :created_at
      column :updated_at
      actions
  end

  form do |f|
      f.inputs "Данные специалиста" do
          f.input :name
          f.input :profession
          f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
          f.input :content, input_html: {class: "redactor" }
          f.input :education
          f.input :experience
          f.input :diploma
          f.input :role_id, :label => 'Направление деятельности', :as => :select, :collection => Expert::ROLES.invert
          f.input :fl_order
      end
      f.inputs "Сервисы" do
          f.input :services, as: :check_boxes
      end
      f.actions
  end
end
