# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :team_games, dependent: :destroy
  has_many :games, through: :team_games

  validates :title, presence: true
end
