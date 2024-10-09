# frozen_string_literal: true

class Statistic < ApplicationRecord
  validates :metrics, presence: true
  validates :type, presence: true, uniqueness: true
end
