class Statistic::Midfielder < Statistic
  attribute :metrics, Statistic::Metrics::Midfielder.to_type
end