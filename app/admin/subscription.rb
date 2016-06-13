ActiveAdmin.register Subscription do

  permit_params :name, :service_id, :preview, :content, :post_id, :price, :discount, :fl_status, :photo

  index do
      column :id
      column :name
      column :service
      column :preview
      column :price
      column :discount
      column :status
      actions
  end

  form do |f|
      f.inputs "Данные абонемента" do
          f.input :name
          f.input :service
          f.input :preview
          f.input :content, input_html: {class: "redactor" }
          f.input :price
          f.input :discount
          f.input :fl_status, :label => 'Статус', :as => :select, :collection => Subscription::STATUSES, :prompt => '--'
          f.input :post_id
          f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
      end
      f.actions
  end
end
