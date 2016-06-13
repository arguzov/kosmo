class AddLinkToPromo < ActiveRecord::Migration
  def change
    add_column :promos, :more_link, :string
  end
end
