ActiveAdmin.register Faq do
  menu label: "Блог"

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :question, :answer, :fl_show, :photo

  index do
    column :name
    column :author
    column :fl_show
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Данные записи" do
      f.input :name
      f.input :author
      f.input :question, input_html: {class: "redactor" }
      f.input :answer, input_html: {class: "redactor" }
      f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:thumb))
      f.input :fl_show
    end
    f.actions
  end

end
