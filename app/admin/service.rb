ActiveAdmin.register Service do
  permit_params :name, :anounce, :photo, :content, :price, :title, :description, :keys, :complements, :fl_show, :pricelist,:parent_id,:url, expert_ids: []
  #fdddsf
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
          f.input :keys
          f.input :complements
      end
      f.inputs "Специалисты" do
          f.input :experts, as: :check_boxes
      end
      f.actions
  end
end
