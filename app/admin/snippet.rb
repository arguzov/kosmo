ActiveAdmin.register Snippet do
    menu :if => proc{ current_user.id < 3 }, label: "Фрагменты"

  permit_params :service_id, :block_id, :content, :name
  #fdddsf
  index do
      column :name
      column :service
      column :block
      column :created_at
      column :updated_at
      actions
  end

  form do |f|
      f.inputs "Фрагмент" do
          f.input :name, :label=>'Название'
          f.input :service_id, :label => 'Услуга', :as => :select, :collection => Service.all.map{|c| ["#{c.name}", c.id]}
          f.input :block_id, :label => 'Блок', :as => :select, :collection => Block.all.map{|c| ["#{c.name}", c.id]}
          f.input :content, :label => 'Текст', input_html: {class: 'redactor'}
      end
      f.actions
  end
end
