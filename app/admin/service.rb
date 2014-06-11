ActiveAdmin.register Service do
  permit_params :name, :anounce, :photo, :content, :price, :title, :description, :fl_show, :pricelist,:parent_id,:url

  index do
      column :name
      column :price
      column :fl_show
      default_actions
  end

  form do |f|
      f.inputs "Услуга" do
          f.input :name
          f.input :url
          f.input :parent_id, :label => 'Родитель', :as => :select, :collection => Service.for_select, :include_blank => false
          f.input :anounce
          f.input :content, input_html: {class: "redactor" }
          f.input :price
          f.input :pricelist
          f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
          f.input :fl_show
          f.input :title
          f.input :description
      end
      f.actions
  end
end
