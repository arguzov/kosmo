class CreateExpertsPostsJoinTable < ActiveRecord::Migration
    def self.up
        create_table :experts_posts, :id => false do |t|
            t.integer :post_id
            t.integer :expert_id
        end

        add_index :experts_posts, [:post_id, :expert_id]
    end

    def self.down
        drop_table :experts_posts
    end
end

