class User < ApplicationRecord
  has_secure_password
  has_many :events, foreign_key: "creator_id", class_name: "Event"
  validates_uniqueness_of :email
end
