class FaqSerializer < ActiveModel::Serializer
  attributes :id, :name, :question, :answer, :fl_show
end
