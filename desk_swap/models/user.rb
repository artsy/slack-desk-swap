class User < ActiveRecord::Base
  has_many :users
  has_many :rounds

  scope :has_location,  -> { where.not(location: nil) }
end
