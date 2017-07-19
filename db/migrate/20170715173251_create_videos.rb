class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :service_id
      t.boolean :is_show_on_service_page
      t.text :code
      t.timestamps
    end
  end
end
