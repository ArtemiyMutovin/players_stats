class Statistic::Metrics::Defender
  include StoreModel::Model

  attribute :tackles, :string
  attribute :blocked_shots, :string
  attribute :interceptions, :string

  validates :tackles, presence: true
  validates :blocked_shots, presence: true
  validates :interceptions, presence: true
end