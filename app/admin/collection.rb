ActiveAdmin.register Collection do
    permit_params :name, :fl_show, :url, :description, :title, :unit_id

    index do
        column :name
        column :title
        column :url
        column :unit
        column :fl_show
        actions
    end

    form do |f|
        f.inputs "Коллекция" do
            f.input :name
            f.input :title
            f.input :url
            f.input :unit
            f.input :description, input_html: {class: 'redactor'}
            f.input :fl_show
        end
        f.actions
    end
  
end
