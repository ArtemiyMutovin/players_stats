# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team do
  it { is_expected.to have_many :player_game_statistics }
  it { is_expected.to have_many :team_games }
  it { is_expected.to have_many(:games).through(:team_games) }

  it { is_expected.to validate_presence_of(:title) }
end
