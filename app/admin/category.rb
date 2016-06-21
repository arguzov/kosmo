ActiveAdmin.register Category do
    menu false
    permit_params :name, :fl_status, :fl_menu, :title, :description
    form do |f|
        f.inputs "Редактировать категорию" do
            f.input :name
            f.input :fl_status, :label => 'Статус', :as => :select, :collection => Category::STATUSES, :prompt => '--'
            f.input :fl_menu, :label => 'В меню'
            f.input :title
            f.input :description
        end
        f.actions
    end
end
