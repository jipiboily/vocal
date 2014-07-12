class ChangeDateFieldFormat < ActiveRecord::Migration
  def up
    change_column :vocal_posts, :published_at, :date
  end

  def down
    change_column :vocal_posts, :published_at, :datetime
  end
end
