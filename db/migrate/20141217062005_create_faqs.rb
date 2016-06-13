class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :name
      t.text :question
      t.text :answer
      t.boolean :fl_show

      t.timestamps
    end
  end
end
