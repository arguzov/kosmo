ActiveAdmin.register MailTemplate do
    menu label: "Рассылка"

    permit_params :name, :group_id, :preview, :content, :fl_active

    index do
        column :name
        column :fl_active
        column :group
        actions
    end

    form do |f|
        f.inputs "Продукт" do
            f.input :name
            f.input :group_id, :label => 'Группа', :as => :select, :collection => Group.all.map{|c| ["#{c.name}", c.id]}
            f.input :preview, input_html: {class: 'redactor'}
            f.input :content, input_html: {class: 'redactor'}
            f.input :fl_active
        end
        f.actions
    end
  
end
