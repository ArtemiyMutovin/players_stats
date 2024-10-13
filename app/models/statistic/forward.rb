class Statistic::Forward < Statistic
  attribute :metrics, Statistic::Metrics::Forward.to_type
end