class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.references :team, foreign_key: true
      t.date :start_date

      t.timestamps
    end
  end
end
