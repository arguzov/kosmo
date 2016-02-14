ActiveAdmin.register Unit do

    permit_params :name, :url, :description, :parent

    index do
        column :name
        column :url
        column :parent
        actions
    end

    form do |f|
        f.inputs "Данные блока" do
            f.input :name
            f.input :url
            f.input :parent
            f.input :description, input_html: {class: "redactor" }
        end
        f.actions
    end
end
