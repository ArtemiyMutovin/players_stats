class CreateTeamGames < ActiveRecord::Migration[7.2]
  def change
    create_table :team_games do |t|
      t.float :importance, null: false, default: 0.1
      t.boolean :home, null: false, default: false
      t.references :team, foreign_key: true, null: false, index: true
      t.references :game, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
