json.array!(@gategories) do |gategory|
  json.extract! gategory, :id, :name, :fl_status, :title, :description
  json.url gategory_url(gategory, format: :json)
end
