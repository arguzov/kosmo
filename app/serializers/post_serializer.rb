class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id, :user_id, :fl_status, :anounce, :content, :title, :description
end
