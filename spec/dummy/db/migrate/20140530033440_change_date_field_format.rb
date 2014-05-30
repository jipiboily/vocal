class ChangeDateFieldFormat < ActiveRecord::Migration
  def up
    change_column :opinionated_posts, :published_at, :date
  end

  def down
    change_column :opinionated_posts, :published_at, :datetime
  end
end
