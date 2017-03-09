class AddDueDateToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :due_date, :date
  end
end
