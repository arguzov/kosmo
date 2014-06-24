ActiveAdmin.register Promo do

    permit_params :name, :content, :banner, :fl_active, :fl_top, :fl_banner, :due, :photo, service_ids: []

    index do
        column :id
        column :name
        column :fl_active
        column :fl_top
        column :fl_banner
        column :created_at
        default_actions
    end

    form do |f|
        f.inputs "Данные акции" do
            f.input :name
            f.input :content, input_html: {class: "redactor" }
            f.input :banner, input_html: {class: "redactor" }
            f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
            f.input :fl_active
            f.input :fl_top
            f.input :fl_banner
            f.input :due
        end
        f.inputs "Сервисы" do
            f.input :services, as: :check_boxes
        end
        f.actions
    end
  
end
