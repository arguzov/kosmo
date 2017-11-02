ActiveAdmin.register Photo do
    menu :if => proc{ current_user.id < 5 }, label: "Фото"
    permit_params :name, :service_id, :photo_type, :photo_group, :description, :img

    index do
        column "Фото" do |photo|
            image_tag photo.img.url(:thumb)
        end
        column :name
        column :service
        column :type
        column :photo_group
        actions
    end

    form do |f|
        f.inputs "Данные фотографии" do
            f.input :name
            f.input :service_id, :label => 'Услуга', :as => :select, :collection => Service.all.map{|c| ["#{c.name}", c.id]}
            f.input :photo_type, :label => 'Тип', :as => :select, :collection => Photo::TYPES, :prompt => '--'
            f.input :photo_group, :label => 'Группа'
            f.input :description, :label => 'Описание', :as => :text
            f.input :img, :as => :file, :hint => f.template.image_tag(f.object.img.url(:thumb))
        end
        f.actions
    end

end
