json.array!(@issues) do |issue|
  json.extract! issue, :id, :name, :content, :title, :description, :fl_show
  json.url issue_url(issue, format: :json)
end
