# This migration comes from vocal (originally 20140302064841)
class CreateVocalPosts < ActiveRecord::Migration
  def change
    create_table :vocal_posts do |t|
      t.string :title
      t.text :markdown
      t.text :html
      t.integer :state
      t.integer :user_id
      t.string :url
      t.datetime :published_at

      t.timestamps
    end

    add_index :vocal_posts, :url
  end
end
