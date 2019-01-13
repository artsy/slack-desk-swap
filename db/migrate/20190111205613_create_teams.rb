class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :team_id
      t.string :team_domain
      t.integer :question_day

      t.timestamps
    end
  end
end
