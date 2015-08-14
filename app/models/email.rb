class Email < ActiveRecord::Base
  validates_uniqueness_of :eid
  before_create :generate_eid
  after_save :create_tracker

  private

  def generate_eid
    require 'securerandom'
    eid = SecureRandom.hex(16)
    self.eid = eid
  end

  def create_tracker
    Tracker.create({email_id: self.id})
  end

  has_one :tracker
end
