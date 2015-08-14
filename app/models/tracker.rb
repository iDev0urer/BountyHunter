class Tracker < ActiveRecord::Base
  validates_uniqueness_of :email_id
  validates_presence_of :email_id

  belongs_to :email
end
