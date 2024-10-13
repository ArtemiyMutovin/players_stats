class Statistic::Metrics::Goalkeeper
  include StoreModel::Model

  attribute :saves, :string
  attribute :penalties_saved, :string
  attribute :catches, :string

  validates :saves, presence: true
  validates :penalties_saved, presence: true
  validates :catches, presence: true
end