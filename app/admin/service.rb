ActiveAdmin.register Service do
    menu label: "Услуги"

  permit_params :name, :anounce, :photo, :content, :price, :title, :description, :keys, :complements, :fl_show, :fl_publish, :pricelist,:parent_id,:url, :metrika_id, expert_ids: []
  #fdddsf
  index do
      column :name
      column :title
      column :price
      column :fl_show
	  column :fl_publish
      actions
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
		  f.input :fl_publish
          f.input :title
          f.input :description
          f.input :keys
          f.input :complements
          f.input :metrika_id
      end
      f.inputs "Специалисты" do
          f.input :experts, as: :check_boxes
      end
      f.actions
  end
end
