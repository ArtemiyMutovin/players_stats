# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :team_games, dependent: :destroy
  has_many :games, through: :team_games
  has_many :player_game_statistics, dependent: :destroy

  validates :title, presence: true
end
