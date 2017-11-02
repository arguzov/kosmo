ActiveAdmin.register Service do
    menu :if => proc{ current_user.id < 5 }, label: "Услуги"

  permit_params :name, :anounce, :photo, :content, :price, :css, :title, :description, :keys, :complements, :fl_show, :fl_publish, :pricelist,:parent_id,:url, :is_structured, :fl_order, :metrika_id, expert_ids: [], filial_ids: [], block_ids: []

  index do
      column :name
      column :title
      column :price
      column :fl_order
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
          f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
          f.input :fl_show
		  f.input :fl_publish
          f.input :title
          f.input :description
          f.input :css
          #f.input :metrika_id
          f.input :fl_order, :label => 'Порядок'
          f.input :is_structured, :label => 'Структурирована'
      end
      f.inputs "Блоки" do
          f.input :blocks, as: :check_boxes
      end
      f.inputs "Специалисты" do
          f.input :experts, as: :check_boxes
      end
      f.inputs "Филиалы" do
          f.input :filials, as: :check_boxes
      end
      f.actions
  end
end
