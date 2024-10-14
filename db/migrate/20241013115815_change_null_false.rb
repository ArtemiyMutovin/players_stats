class ChangeNullFalse < ActiveRecord::Migration[7.2]
  def change
    change_column_null :player_game_statistics, :team_id, false
  end
end
