class OrderSerializer < ActiveModel::Serializer
  attributes :id, :contacts, :content
end
