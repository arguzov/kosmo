ActiveAdmin.register Issue do
  menu :if => proc{ current_user.id < 5 }, label: "Проблемы"
  permit_params :name, :url, :content, :title, :description, :fl_show, :parent_id, service_ids: [], shop_product_ids: []

  index do
      column :name
      column :parent_id
      column :fl_show
      column :created_at
      column :updated_at
      actions
  end

    form do |f|
        f.inputs "Редактировать проблему" do
            f.input :name, :label => 'Название'
            f.input :url, :label => 'Url'
            f.input :content, input_html: {class: "redactor" }
            f.input :title, :label => 'Титл'
            f.input :description, :label => 'Описание'
            f.input :fl_show, :label=>'Активный'
            f.input :parent_id, :label => 'Родитель', :as => :select, :collection => Issue.where('parent_id = 0').map{|u| ["#{u.name}", u.id]}
        end
        f.inputs "Сервисы" do
            f.input :services, as: :check_boxes
        end
        f.inputs "Товары" do
            f.input :shop_products, as: :check_boxes
        end
        f.actions
    end
  
end
