# frozen_string_literal: true

FactoryBot.define do
  factory :player_game_statistic do
    rate { 1 }
    team
    player
    game
    statistic
  end
end
