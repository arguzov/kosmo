ActiveAdmin.register Discount do
    menu label: "Скидки"
    permit_params :price_id, :promo_id, :service_id, :due_date, :value, :value_unit, :fl_new

    index do
        column :price_id
        column :service
        column :promo
        column :due_date
        column :value
        column :value_unit
        column :fl_new
        actions
    end

    form do |f|
        f.inputs "Данные скидки" do
            f.input :price_id, :label => 'Id цены'
            f.input :service_id, :label => 'Сервис', :as => :select, :collection => Service.all.map{|c| ["#{c.name}", c.id]}
            f.input :promo_id, :label => 'Акция', :as => :select, :collection => Promo.all.map{|c| ["#{c.name}", c.id]}
            f.input :due_date, :label => 'Срок окончания'
            f.input :value, :label => 'Величина скидки'
            f.input :value_unit, :label => 'Единица измерения', :as => :select, :collection => Discount::UNITS.invert
            f.input :fl_new, :label => 'Только для новых'
        end
        f.actions
    end

end
