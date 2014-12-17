class AddAuthorToFaq < ActiveRecord::Migration
  def change
    add_column :faqs, :author, :string
  end
end
