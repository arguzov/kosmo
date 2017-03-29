ActiveAdmin.register Post do
    menu :if => proc{ current_user.id < 3 }, label: "Статьи"

    permit_params :name, :user_id, :category_id, :anounce, :content, :fl_status, :fl_menu, :title, :description, :photo, :person, expert_ids: [], service_ids: []

    index do
        column :name
        column :category_name
        column :fl_menu
        column :created_at
        column :updated_at
        actions
    end

    form do |f|
        f.inputs "Текст" do
            f.input :content, input_html: {class: "redactor" }
        end
        f.inputs "Данные записи" do
            f.input :name
            f.input :category_id, :label => 'Категория', :as => :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
            f.input :fl_status, :label => 'Статус', :as => :select, :collection => Post::STATUSES, :prompt => '--'
            f.input :fl_menu, :label => 'В меню'
            f.input :user_id, :label => 'Автор', :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
            f.input :person, :label => 'Персона'
            f.input :anounce
            f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
            f.input :title
            f.input :description
        end
        f.inputs "Специалисты" do
            f.input :experts, as: :check_boxes
        end
        # fix
        f.inputs "Услуги" do
            f.input :services, as: :check_boxes
        end
        f.actions
    end

end
