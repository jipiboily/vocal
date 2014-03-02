class CreateOpinionatedPosts < ActiveRecord::Migration
  def change
    create_table :opinionated_posts do |t|
      t.string :title
      t.text :markdown
      t.text :html
      t.integer :state
      t.integer :user_id

      t.timestamps
    end
  end
end
