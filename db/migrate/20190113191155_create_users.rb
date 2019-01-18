class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :user_name
      t.string :real_name
      t.string :department
      t.string :tz
      t.integer :tz_offset
      t.string :location
      t.string :setup

      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
