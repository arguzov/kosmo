ActiveAdmin.register Price do
    permit_params :name, :service_id, :price
    controller do
        def scoped_collection
            Price.with_price
        end
    end

    index do
        column :name
        column :service
        column :price
        actions
    end

    form do |f|
        f.inputs "Данные записи" do
            f.input :name
            f.input :service_id, :label => 'Категория', :as => :select, :collection => Service.all.map{|c| ["#{c.name}", c.id]}
            f.input :price
        end
        f.actions
    end

end
