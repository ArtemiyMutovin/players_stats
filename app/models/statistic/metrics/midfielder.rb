class Statistic::Metrics::Midfielder
  include StoreModel::Model

  attribute :freekicks, :string
  attribute :crosses, :string
  attribute :passes, :string

  validates :freekicks, presence: true
  validates :crosses, presence: true
  validates :passes, presence: true
end