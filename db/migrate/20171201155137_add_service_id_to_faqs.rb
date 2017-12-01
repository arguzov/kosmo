class AddServiceIdToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :service_id, :integer
  end
end
