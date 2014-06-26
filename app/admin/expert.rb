ActiveAdmin.register Expert do

  permit_params :name, :content, :profession, :photo, :education, :experience, :diploma, :fl_order, service_ids: []

  index do
      column :id
      column :name
      column :profession
      column :fl_order
      column :created_at
      column :updated_at
      default_actions
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
          f.input :fl_order
      end
      f.inputs "Сервисы" do
          f.input :services, as: :check_boxes
      end
      f.actions
  end
end
