# frozen_string_literal: true

module Statistics
  class Goalkeeper < Statistic
    attribute :metrics, Statistics::Metrics::Goalkeeper.to_type

    def calculate_rate
      (metrics.saves.to_i * 3) + (metrics.penalties_saved.to_i * 2) + (metrics.catches.to_i * 1)
    end
  end
end
