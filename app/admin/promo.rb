ActiveAdmin.register Promo do
    menu :if => proc{ current_user.id < 3 }, label: "Акции"

    controller do
        def scoped_collection
            Promo.unscoped
        end
    end

    permit_params :name, :content, :banner, :fl_active, :fl_top, :fl_banner, :due, :more_link, :photo, service_ids: []

    index do
        column :id
        column :name
        column :fl_active
        column :fl_top
        column :fl_banner
        column :created_at
        actions
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
            f.input :more_link
        end
        f.inputs "Сервисы" do
            f.input :services, as: :check_boxes
        end
        f.actions
    end
  
end
