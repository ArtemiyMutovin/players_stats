# frozen_string_literal: true

module Statistics
  class Midfielder < Statistic
    attribute :metrics, Statistics::Metrics::Midfielder.to_type

    def calculate_rate
      (metrics.freekicks.to_i * 3) + (metrics.crosses.to_i * 2) + (metrics.passes.to_i * 1)
    end
  end
end
