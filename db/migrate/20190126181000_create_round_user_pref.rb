class CreateRoundUserPref < ActiveRecord::Migration[5.0]
  def change
    create_table :round_user_preferences do |t|
      t.references :round, foreign_key: true
      t.references :user, foreign_key: true
      t.jsonb :preferences, null: false, default: {}
    end
  end
end
