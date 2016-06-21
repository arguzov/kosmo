ActiveAdmin.register Group do
    menu label: "Пользователи группы"

    permit_params :name, user_ids: []

    index do
        column :name
        actions
    end

    form do |f|
        f.inputs "Данные группы" do
            f.input :name
        end
        f.inputs "Пользователи" do
            f.input :users, as: :check_boxes
        end
        f.actions
    end
  
end
