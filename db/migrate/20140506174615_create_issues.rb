class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.text :content
      t.string :title
      t.string :description
      t.boolean :fl_show

      t.timestamps
    end
  end
end
