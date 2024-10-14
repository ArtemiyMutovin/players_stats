# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :players, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
