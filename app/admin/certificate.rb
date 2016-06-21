ActiveAdmin.register Certificate do
 menu false

  permit_params :name, :preview, :content, :price, :discount, :fl_status, :fl_type,  :photo, service_ids: []

  index do
      column :id
      column :name
      column :preview
      column :price
      column :discount
      column :status
      column :type
      actions
  end

  form do |f|
      f.inputs "Данные сертификата" do
          f.input :name
          f.input :preview
          f.input :content, input_html: {class: "redactor" }
          f.input :price
          f.input :discount
          f.input :fl_status, :label => 'Статус', :as => :select, :collection => Certificate::STATUSES, :prompt => '--'
          f.input :fl_type, :label => 'Тип', :as => :select, :collection => Certificate::TYPES, :prompt => '--'
          f.input :group_id
          f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
      end
      f.inputs "Сервисы" do
          f.input :services, as: :check_boxes
      end
      f.actions
  end


end
