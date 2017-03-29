ActiveAdmin.register Medicament do
    menu :if => proc{ current_user.id < 3 }, label: "Препараты"

    permit_params :name, :content, :anounce, :photo, :title, :description, :fl_show, :service_id

    index do
        column :name
        column :service_id
        column :fl_show
        actions
    end

    form do |f|
        f.inputs "Услуга" do
            f.input :name
            f.input :service_id, :label => 'Сервис', :as => :select, :collection => Service.all.map{|c| ["#{c.name}", c.id]}
            f.input :anounce
            f.input :content, input_html: {class: 'redactor'}
            f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
            f.input :fl_show
            f.input :title
            f.input :description
        end
        f.actions
    end
  
end
