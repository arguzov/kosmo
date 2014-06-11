json.array!(@medicaments) do |medicament|
  json.extract! medicament, :id, :name, :content, :service_id, :title, :description, :fl_show
  json.url medicament_url(medicament, format: :json)
end
