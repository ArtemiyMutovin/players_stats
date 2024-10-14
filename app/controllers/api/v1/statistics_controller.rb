# frozen_string_literal: true

module Api
  module V1
    class StatisticsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]
      include Pagy::Backend

      def create
        PlayerGameStatistics::CreateJob.perform_async(@game_id, @player_id, @metrics)

        render json: { status: :ok }
      end

      def top_players
        player_statistics = PlayerGameStatistic.all
        if params[:start_date] && params[:end_date]
          player_statistics = player_statistics.by_date_range(params[:start_date], params[:end_date])
        end
        player_statistics = player_statistics.by_team(params[:team_id]) if params[:team_id].present?
        player_statistics = player_statistics.by_role(params[:role_id]) if params[:role_id].present?

        ordered_players = Player.with_average_rating_ordered(player_statistics)

        pagy, players = pagy(ordered_players, items: params[:limit] || 5, page: params[:page])

        if players.empty?
          render json: { error: 'No players found' }, status: :not_found
        else
          render json: {
            players: Panko::ArraySerializer.new(players, each_serializer: TopPlayerSerializer),
            pagination: pagy_metadata(pagy)
          }
        end
      end
    end
  end
end
