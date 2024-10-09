# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :role
  belongs_to :team

  validates :name, presence: true
end
