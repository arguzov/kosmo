class MedicamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :service_id, :title, :description, :fl_show
end
