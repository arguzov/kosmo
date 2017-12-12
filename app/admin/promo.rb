ActiveAdmin.register Promo do
    menu :if => proc{ current_user.id < 5 }, label: "Акции"

    controller do
        def scoped_collection
            Promo.unscoped
        end
    end

    permit_params :name, :content, :banner, :fl_active, :fl_top, :fl_menu, :fl_banner, :fl_order, :due, :more_link, :photo, service_ids: []

    index do
        column :id
        column :name
        column :fl_active
        column :fl_top
        column :fl_menu
        column :fl_order
        column :created_at
        actions
    end

    form do |f|
        f.inputs "Данные акции" do
            f.input :name, :label => 'Название акции'
            f.input :content, input_html: {class: "redactor" }
            f.input :banner, input_html: {class: "redactor" }
            f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
            f.input :fl_active, :label => 'Активный'
            f.input :fl_menu, :label => 'Показывать в списке'
            f.input :fl_order, :label => 'Порядок сортировки'
            f.input :due, :label => 'Дата окончания'
            f.input :more_link, :label => 'Ссылка на статью'
        end
        f.inputs "Сервисы" do
            f.input :services, as: :check_boxes
        end
        f.actions
    end
  
end
