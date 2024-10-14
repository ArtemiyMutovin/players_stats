# frozen_string_literal: true

require "rails_helper"

describe 'api/v1/statistics' do
  describe '/top_players' do
    let(:role) { create(:role, :forward) }
    let(:team) { create(:team) }
    let(:player) { create(:player, role: role, team: team, name: 'player 1') }

    before do
      create_list(
        :player_game_statistic,
        5,
        player: player,
        team: team,
        created_at: '2023-06-01',
        rate: 4.5
      )
    end

    describe 'GET' do
      subject { get '/api/v1/statistics/top_players', params: params }

      let(:params) do
        {
          role_id: role.id,
          team_id: team.id,
          start_date: '2023-01-01',
          end_date: '2023-12-31',
        }
      end

      it 'returns a 200 status' do
        subject
        expect(response).to have_http_status(200)
      end

      context 'when no players are found' do
        before { PlayerGameStatistic.delete_all }

        it 'returns a 404 status' do
          subject
          expect(response).to have_http_status(404)
        end
      end

      context 'with invalid date format' do
        let(:params) { super().merge(start_date: 'invalid-date') }

        it 'returns a 404 status' do
          subject
          expect(response).to have_http_status(404)
        end
      end
    end
  end

  describe '/statistics' do
    let(:role) { create(:role, :forward) }
    let(:team) { create(:team) }
    let(:player) { create(:player, role: role, team: team, name: 'player 15') }
    let(:game) { create(:game) }

    describe 'POST' do
      subject { post '/api/v1/statistics/create', params: body, as: :json }

      let(:body) { { game_id: game.id, player_id: player.id, metrics: { goals: 2, assists: 1, shots: 2 } } }

      it 'returns a 200 status' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end