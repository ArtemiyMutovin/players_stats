# frozen_string_literal: true

module Statistics
  class Defender < Statistic
    attribute :metrics, Statistics::Metrics::Defender.to_type

    def calculate_rate
      (metrics.tackles.to_i * 3) + (metrics.blocked_shots.to_i * 2) + (metrics.interceptions.to_i * 1)
    end
  end
end
