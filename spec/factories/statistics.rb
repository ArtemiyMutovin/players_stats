# frozen_string_literal: true

FactoryBot.define do
  factory :statistic do
    type { 'Forward' }
    metrics { { goals: 1, assists: 2, shots: 3 } }
  end
end
