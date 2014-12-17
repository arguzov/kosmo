json.array!(@faqs) do |faq|
  json.extract! faq, :id, :name, :question, :answer, :fl_show
  json.url faq_url(faq, format: :json)
end
