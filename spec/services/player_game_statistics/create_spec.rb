# frozen_string_literal: true

# spec/services/player_game_statistics/create_spec.rb
require 'rails_helper'

RSpec.describe PlayerGameStatistics::Create do
  subject(:service) { described_class.new(game_id: game.id, player_id: player.id, metrics:) }

  let(:game) { create(:game) }
  let(:role) { create(:role, :forward) }
  let(:player) { create(:player, role:) }
  let(:metrics) { { goals: 30, assists: 5, shots: 100 } }

  describe '#call' do
    context 'when valid data is provided' do
      it 'creates a statistics for the player based on role' do
        expect do
          service.call
        end.to change(Statistics::Forward, :count).by(1)
      end

      # rubocop:disable  RSpec/MultipleExpectations
      it 'creates a PlayerGameStatistic with correct parameters' do
        expect do
          service.call
        end.to change(PlayerGameStatistic, :count).by(1)

        player_game_stat = PlayerGameStatistic.last
        expect(player_game_stat.player).to eq(player)
        expect(player_game_stat.game).to eq(game)
        expect(player_game_stat.team).to eq(player.team)
        expect(player_game_stat.statistic).to be_a(Statistics::Forward)
        expect(player_game_stat.rate).not_to be_nil
      end
      # rubocop:enable  RSpec/MultipleExpectations
    end

    context 'when data is invalid' do
      it 'does not create a statistics if game_id is missing' do
        invalid_service = described_class.new(game_id: nil, player_id: player.id, metrics:)
        expect do
          invalid_service.call
        end.not_to change(Statistics::Forward, :count)
      end

      it 'does not create a statistics if player_id is missing' do
        invalid_service = described_class.new(game_id: game.id, player_id: nil, metrics:)
        expect do
          invalid_service.call
        end.not_to change(Statistics::Forward, :count)
      end

      it 'does not create a statistics if metrics are missing' do
        invalid_service = described_class.new(game_id: game.id, player_id: player.id, metrics: nil)
        expect do
          invalid_service.call
        end.not_to change(Statistics::Forward, :count)
      end
    end
  end
end
