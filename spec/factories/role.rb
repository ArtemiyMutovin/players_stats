# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    trait :forward do
      name { 'Forward' }
    end

    trait :defender do
      name { 'Defender' }
    end

    trait :goalkeeper do
      name { 'Goalkeeper' }
    end

    trait :midfielder do
      name { 'Midfielder' }
    end
  end
end
