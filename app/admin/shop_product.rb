ActiveAdmin.register ShopProduct do
    menu :if => proc{ current_user.id < 3 }, label: "Товары"
    permit_params :name, :collection_id, :url, :description, :title, :brand_id, :photo, service_ids: [], issue_ids: [], part_ids: []

    index do
        column :name
        column :title
        column :collection
        column :brand
        column :url
        actions
    end

    form do |f|
        f.inputs "Продукт" do
            f.input :name
            f.input :category_id, :label => 'Линия', :as => :select, :collection => ShopCategory.all.map{|c| ["#{c.name}", c.id]}
            f.input :brand
            f.input :url
            f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
            f.input :description, input_html: {class: 'redactor'}
        end

        f.inputs "Услуги" do
            f.input :services, as: :check_boxes
        end

        f.inputs "Проблемы" do
            f.input :issues, as: :check_boxes
        end

        f.inputs "Части тела" do
            f.input :parts, as: :check_boxes
        end

        f.actions

    end
  
end
