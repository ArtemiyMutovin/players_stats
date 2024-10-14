# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :role
  belongs_to :team
  has_many :player_game_statistics

  validates :name, presence: true

  def self.with_average_rating_ordered(player_statistics)
    joins(:player_game_statistics)
      .merge(player_statistics)
      .select('players.*, AVG(player_game_statistics.rate) AS average_rating')
      .group('players.id')
      .order('AVG(player_game_statistics.rate) DESC')
  end
end
