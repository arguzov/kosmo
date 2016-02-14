ActiveAdmin.register User do

    permit_params :name, :email, :phone, :admin, :discount

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
        f.actions
    end
  
end
