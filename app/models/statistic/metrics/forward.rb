class Statistic::Metrics::Forward
  include StoreModel::Model

  attribute :goals, :string
  attribute :assists, :string
  attribute :shots, :string

  validates :goals, presence: true
  validates :assists, presence: true
  validates :shots, presence: true
end