class RoundUserPreference < ActiveRecord::Base
  store :preferences, accessors: [ :available_dates ], coder: JSON
  belongs_to :round
  belongs_to :user
end
