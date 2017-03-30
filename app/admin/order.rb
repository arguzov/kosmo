ActiveAdmin.register Order do
    menu :if => proc{ current_user.id < 3 }, label: "Заказы"

    scope :requests, default: true
    scope :certificates

    index do
        column :created_at
        column :order_type
        column :contacts
        column :content
        column :url
        column :filial
        actions
    end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
