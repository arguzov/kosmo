class AddPersonToPost < ActiveRecord::Migration
  def change
    add_column :posts, :person, :string
  end
end
