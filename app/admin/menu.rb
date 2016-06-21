ActiveAdmin.register Menu do
    menu false
    permit_params :title, :url, :parent_id, :fl_type, :post_id, :category_id
    form do |f|
        f.inputs "Строка меню" do
            f.input :title
            f.input :url
            f.input :fl_type, :label => 'Тип', :as => :select, :collection => Menu::TYPES, :prompt => '--'
            f.input :parent_id, :label => 'Родитель', :as => :select, :collection => Menu.where('parent_id = 0').map{|c| ["#{c.title}", c.id]}, :prompt => '--'
            f.input :category_id, :label => 'Категория', :as => :select, :collection => Category.all.map{|c| ["#{c.name}", c.id]}
            f.input :post_id, :label => 'Id записи'
        end
        f.actions
    end

    controller do
        def create
            create! do |format|
                format.html { redirect_to admin_menus_path }
            end
        end
        def update
            update! do |format|
                flash[:notice] = "Запись обновлена"
                format.html { redirect_to edit_admin_menu_path(id: params[:id]) }
            end
        end
    end
end
