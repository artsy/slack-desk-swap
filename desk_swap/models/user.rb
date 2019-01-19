class User < ActiveRecord::Base
  has_many :users
  has_many :rounds
end
