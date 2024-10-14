# frozen_string_literal: true

FactoryBot.define do
  sequence :player_name do |n|
    "player name #{n}"
  end
  factory :player do
    name { generate(:player_name) }
    team
    role
  end
end
