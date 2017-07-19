ActiveAdmin.register Video do
    menu :if => proc{ current_user.id < 3 }, label: "Видео"

  permit_params :name, :service_id, :is_show_on_service_page, :code
  index do
      column :name
      column :service
      column :is_show_on_service_page
      actions
  end

  form do |f|
      f.inputs "Видео" do
          f.input :name, :label=>'Название'
          f.input :service_id, :label => 'Услуга', :as => :select, :collection => Service.all.map{|c| ["#{c.name}", c.id]}
          f.input :is_show_on_service_page, :label => 'Показывать на странице услуги'
          f.input :code, :label => 'Код ролика'
      end
      f.actions
  end
end
