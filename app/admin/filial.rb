ActiveAdmin.register Filial do
    menu :if => proc{ current_user.id < 3 }, label: "Филиалы"

  permit_params :address, :phones, :email, :description, service_ids: []
  #fdddsf
  index do
      column :address
      column :phones
      column :email
      actions
  end

  form do |f|
      f.inputs "Фидиал" do
          f.input :address, :label=>'Адрес'
          f.input :phones, :label=>'Телефоны'
          f.input :email, :label=>'Email'
          f.input :description, input_html: {class: "redactor" }
      end
      f.inputs "Услуги" do
          f.input :services, as: :check_boxes
      end
      f.actions
  end
end
