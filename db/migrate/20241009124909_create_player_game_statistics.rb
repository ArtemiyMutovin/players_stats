class CreatePlayerGameStatistics < ActiveRecord::Migration[7.2]
  def change
    create_table :player_game_statistics do |t|
      t.references :player, foreign_key: true, null: false, index: true
      t.references :game, foreign_key: true, null: false, index: true
      t.references :statistic, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
