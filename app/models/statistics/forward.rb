# frozen_string_literal: true

module Statistics
  class Forward < Statistic
    attribute :metrics, Statistics::Metrics::Forward.to_type

    def calculate_rate
      (metrics.goals.to_i * 3) + (metrics.assists.to_i * 2) + (metrics.shots.to_i * 1)
    end
  end
end
