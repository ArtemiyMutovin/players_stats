class Statistic::Goalkeeper < Statistic
  attribute :metrics, Statistic::Metrics::Goalkeeper.to_type
end