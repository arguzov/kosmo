class ExpertSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :photos
end
