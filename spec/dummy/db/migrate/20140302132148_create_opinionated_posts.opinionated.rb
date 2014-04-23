# This migration comes from opinionated (originally 20140302064841)
class CreateOpinionatedPosts < ActiveRecord::Migration
  def change
    create_table :opinionated_posts do |t|
      t.string :title
      t.text :markdown
      t.text :html
      t.integer :state
      t.integer :user_id
      t.string :url
      t.datetime :published_at

      t.timestamps
    end

    add_index :opinionated_posts, :url
  end
end
