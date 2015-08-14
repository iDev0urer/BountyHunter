class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :email_id, null: false, index: true, foreign_key: true
      t.string :ip_addr
      t.string :user_agent
      t.string :browser
      t.integer :views, default: 0
      t.datetime :last_viewed
      t.timestamps null: false
    end
  end
end
