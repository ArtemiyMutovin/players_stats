# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


PlayerGameStatistic.destroy_all
Statistic.destroy_all
TeamGame.destroy_all
Game.destroy_all
Player.destroy_all
Role.destroy_all
Team.destroy_all

team_1 = Team.create!( title: 'Home Team' )
team_2 = Team.create!( title: 'Away Team' )

role_forward = Role.create!( name: 'Forward')
role_defender =  Role.create!( name: 'Defender')
role_midfielder = Role.create!( name: 'Midfielder')
role_goalkeeper = Role.create!( name: 'GoalKeeper')

player_1 = Player.create!( name: 'Player1', team: team_1, role: role_forward )
player_2 = Player.create!( name: 'Player2', team: team_1, role: role_forward )
player_3 = Player.create!( name: 'Player3', team: team_1, role: role_goalkeeper )
player_4 = Player.create!( name: 'Player4', team: team_2, role: role_defender )
player_5 = Player.create!( name: 'Player5', team: team_2, role: role_goalkeeper )
player_6 = Player.create!( name: 'Player6', team: team_2, role: role_midfielder )
player_7 = Player.create!( name: 'Player7', team: team_2, role: role_forward )

game_1 = Game.create!( date: "10.10.2024")
game_2 = Game.create!( date: "15.10.2024")

TeamGame.create!( importance: 0.1, home: true, team: team_1 , game: game_1)
TeamGame.create!( importance: 1, home: false, team: team_2, game: game_1)
TeamGame.create!( importance: 1, home: true, team: team_1, game: game_2)
TeamGame.create!( importance: 0.5, home: false, team: team_2, game: game_2)



statistic_1 = Statistics::Forward.create!(metrics: { goals: 2, assists: 1, shots: 6 })
statistic_2 = Statistics::Forward.create!(metrics: { goals: 0, assists: 0, shots: 2 })
statistic_3 = Statistics::Goalkeeper.create!(metrics: { saves: 6, penalties_saved: 0, catches: 10 })
statistic_4 = Statistics::Defender.create!(metrics: { tackles: 5, blocked_shots: 2, interceptions: 8 })
statistic_5 = Statistics::Goalkeeper.create!(metrics: { saves: 8, penalties_saved: 0, catches: 12 })
statistic_6 = Statistics::Midfielder.create!(metrics: { freekicks: 2, crosses: 3, passes: 9 })
statistic_7 = Statistics::Forward.create!(metrics: { goals: 1, assists: 0, shots: 4 })




PlayerGameStatistic.create!( rate: 10, player: player_1, game: game_1, statistic: statistic_1, team: team_1)
PlayerGameStatistic.create!( rate: 5, player: player_2, game: game_1, statistic: statistic_2, team: team_1)
PlayerGameStatistic.create!( rate: 4, player: player_3, game: game_1, statistic: statistic_3, team: team_1)
PlayerGameStatistic.create!( rate: 6, player: player_4, game: game_1, statistic: statistic_4, team: team_2)
PlayerGameStatistic.create!( rate: 8, player: player_5, game: game_1, statistic: statistic_5, team: team_2)
PlayerGameStatistic.create!( rate: 3, player: player_6, game: game_1, statistic: statistic_6, team: team_2)
PlayerGameStatistic.create!( rate: 1, player: player_7, game: game_1, statistic: statistic_7, team: team_2)

PlayerGameStatistic.create!( rate: 2, player: player_1, game: game_2, statistic: statistic_1, team: team_1)
PlayerGameStatistic.create!( rate: 1, player: player_2, game: game_2, statistic: statistic_2, team: team_1)
PlayerGameStatistic.create!( rate: 7, player: player_3, game: game_2, statistic: statistic_3, team: team_1)
PlayerGameStatistic.create!( rate: 9, player: player_4, game: game_2, statistic: statistic_4, team: team_2)
PlayerGameStatistic.create!( rate: 12, player: player_5, game: game_2, statistic: statistic_5,team: team_2)
PlayerGameStatistic.create!( rate: 5, player: player_6, game: game_2, statistic: statistic_6, team: team_2)
PlayerGameStatistic.create!( rate: 11, player: player_7, game: game_2, statistic: statistic_7, team: team_2)
