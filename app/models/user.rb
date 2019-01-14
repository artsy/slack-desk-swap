class User < ApplicationRecord
  scope :has_location, -> { where.not(location: nil) }
end
