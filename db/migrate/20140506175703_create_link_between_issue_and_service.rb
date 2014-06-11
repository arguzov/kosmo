class CreateLinkBetweenIssueAndService < ActiveRecord::Migration
  def change
      create_table :services_issues, id: false do |t|
          t.belongs_to :service
          t.belongs_to :issue
      end
  end
end
