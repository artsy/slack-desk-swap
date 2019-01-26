class User < ActiveRecord::Base
  has_many :users
  has_many :rounds
  has_many :round_user_preference

  scope :has_location,  -> { where.not(location: nil) }
end
