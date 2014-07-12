# This migration comes from vocal (originally 20140129172910)
class CreateVocalUsers < ActiveRecord::Migration
  def change
    create_table :vocal_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
