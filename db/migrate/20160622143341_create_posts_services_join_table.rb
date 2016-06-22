class CreatePostsServicesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :posts_services, :id => false do |t|
      t.integer :post_id
      t.integer :service_id
    end

    add_index :posts_services, [:post_id, :service_id]
  end

  def self.down
    drop_table :posts_services
  end
end
