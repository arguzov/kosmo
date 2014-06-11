class AddProfessionToExpert < ActiveRecord::Migration
  def change
    add_column :experts, :profession, :string
  end
end
