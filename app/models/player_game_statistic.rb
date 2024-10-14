# frozen_string_literal: true

class PlayerGameStatistic < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :statistic
  belongs_to :team

  validates :rate, presence: true

  scope :by_date_range, ->(start_date, end_date) { where(created_at: start_date..end_date) }
  scope :by_team, ->(team_id) { where(team_id:) }
  scope :by_role, ->(role_id) { joins(:player).where(players: { role_id: }) }
end
