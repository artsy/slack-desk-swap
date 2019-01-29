class Round < ActiveRecord::Base
  belongs_to :team
  has_many :user_preferences, class_name: 'RoundUserPreference'
end
