ActiveAdmin.register Section do
    menu :if => proc{ current_user.id < 3 }, :label=>'Разделы'
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :url, :fl_order, :content, :photo, :parent_id, service_ids: []
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
          f.input :url
          f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
          f.input :content, input_html: {class: "redactor" }
          f.input :parent_section
          f.input :fl_order
      end
      f.inputs "Сервисы" do
          f.input :services, as: :check_boxes
      end
      f.actions
  end
end
