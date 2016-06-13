class IssueSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :title, :description, :fl_show
end
