json.array!(@services) do |service|
  json.extract! service, :id, :name, :content, :title, :description, :fl_show
  json.url service_url(service, format: :json)
end
