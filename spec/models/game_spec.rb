# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game do
  it { is_expected.to have_many :team_games }
  it { is_expected.to have_many(:teams).through(:team_games) }
end
