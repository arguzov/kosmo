ActiveAdmin.register User do
    menu :if => proc{ current_user.id < 3 }, label: "Пользователи"

    permit_params :name, :email, :phone, :admin, :discount, group_ids: []

    index do
        column :name
        column :email
        column :phone
        column :admin
        column :discount
        column :created_at
        column :last_sign_in
        actions
    end

    form do |f|
        f.inputs "Данные пользователя" do
            f.input :name
            f.input :email
            f.input :phone
            f.input :discount
            f.input :admin
        end

        f.inputs "Группы" do
            f.input :groups, as: :check_boxes
        end
        f.actions
    end
  
end
