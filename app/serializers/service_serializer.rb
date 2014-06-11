class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :title, :description, :fl_show
end
