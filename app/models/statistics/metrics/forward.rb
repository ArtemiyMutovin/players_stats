# frozen_string_literal: true

module Statistics
  module Metrics
    class Forward
      include StoreModel::Model

      attribute :goals, :string
      attribute :assists, :string
      attribute :shots, :string

      validates :goals, presence: true
      validates :assists, presence: true
      validates :shots, presence: true
    end
  end
end
