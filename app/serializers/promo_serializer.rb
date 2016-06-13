class PromoSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :banner, :fl_active, :fl_top, :due
end
