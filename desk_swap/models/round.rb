class Round < ActiveRecord::Base
  belongs_to :team
  has_many :round_user_preference
end
