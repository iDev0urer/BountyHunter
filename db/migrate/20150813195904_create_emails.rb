class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :eid, null: false, primary: true, foreign_key: true, unique: true
      t.string :to, null: false
      t.string :from, null: false
      t.string :cc
      t.string :bcc
      t.text :message_body
      t.datetime :sent
    end
  end
end
