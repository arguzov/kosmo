ActiveAdmin.register Product do

    permit_params :name, :collection_id, :url, :description, :title, :photo

    index do
        column :name
        column :title
        column :collection
        column :url
        actions
    end

    form do |f|
        f.inputs "Продукт" do
            f.input :name
            f.input :title
            f.input :collection_id, :label => 'Линия', :as => :select, :collection => Collection.all.map{|c| ["#{c.name}", c.id]}
            f.input :url
            f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
            f.input :description, input_html: {class: 'redactor'}
        end
        f.actions
    end
  
end
