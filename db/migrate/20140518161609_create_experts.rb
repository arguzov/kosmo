class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :name
      t.text :content
      t.string :photo

      t.timestamps
    end
  end
end
