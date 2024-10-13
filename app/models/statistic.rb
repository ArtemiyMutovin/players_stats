# frozen_string_literal: true

class Statistic < ApplicationRecord
  validates :metrics, store_model: { merge_errors: true }
  validates :type, presence: true
end
