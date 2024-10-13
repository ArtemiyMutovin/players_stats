class Statistic::Defender < Statistic
  attribute :metrics, Statistic::Metrics::Defender.to_type
end