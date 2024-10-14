# frozen_string_literal: true

FactoryBot.define do
  sequence :team_name do |n|
    "team name #{n}"
  end
  factory :team do
    title { generate(:team_name) }
  end
end
