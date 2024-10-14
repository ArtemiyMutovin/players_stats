class AddTeamToPlayerGameStatistic < ActiveRecord::Migration[7.2]
  def change
    add_reference :player_game_statistics, :team, foreign_key: true, index: true
  end
end
