# frozen_string_literal: true

class PlayerGameStatistic < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :statistic
  belongs_to :team

  validates :rate, presence: true
end
