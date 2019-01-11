class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :team_id
      t.string :user_name
      t.string :real_name
      t.string :tz
      t.integer :tz_offset
      t.string :location
      t.string :setup

      t.timestamps
    end
  end
end
