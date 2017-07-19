class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string  :name
      t.integer :service_id
      t.integer :block_id
      t.text :content
      t.timestamps
    end
  end
end
