class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :volume, :articul, :price
end
