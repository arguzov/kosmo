ActiveAdmin.register Section do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :fl_order, service_ids: []
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  form do |f|
      f.inputs "Данные раздела" do
          f.input :name
          f.input :fl_order
      end
      f.inputs "Сервисы" do
          f.input :services, as: :check_boxes
      end
      f.actions
  end
end
