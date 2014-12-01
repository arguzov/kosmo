class AddContentFieldToSection < ActiveRecord::Migration
  def change
    add_column :sections, :url, :string
    add_column :sections, :content, :text
  end
end
