class CreateMailTemplates < ActiveRecord::Migration
  def change
    create_table :mail_templates do |t|
      t.string :name
      t.text :preview
      t.text :content
      t.boolean :fl_active
      t.integer :group_id
    end
  end
end
