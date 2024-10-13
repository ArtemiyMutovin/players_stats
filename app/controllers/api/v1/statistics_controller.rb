class Api::V1::StatisticsController < ApplicationController
  include Pagy::Backend

  def create
    player = Player.find(params[:player_id])
    game = Game.find(params[:game_id])
    team = player.team
    PlayerGameStatistic.where(player: player, game: game, team: team)
    Statistic::Forward.create!(metrics: params[:metrics])
  end

  def top_players
    player_statistics = PlayerGameStatistic.all

    if params[:start_date] && params[:end_date]
      player_statistics = player_statistics.where("player_game_statistics.created_at >= ? AND player_game_statistics.created_at <= ?", params[:start_date], params[:end_date])
    end

    if params[:team_id]
      player_statistics = player_statistics.where(team_id: params[:team_id])
    end

    if params[:role_id]
      player_statistics = player_statistics.joins(:player).where(player: { role_id: params[:role_id] })
    end

    subquery = player_statistics
                 .select('player_id, AVG(rate) AS average_rating')
                 .group(:player_id)

    ordered_statistics = PlayerGameStatistic
                           .select('subquery.player_id, subquery.average_rating')
                           .from(subquery, :subquery)
                           .order('subquery.average_rating DESC')

    pagy, players = pagy(ordered_statistics, items: 5)

    render json: { players: players, pagination: pagy_metadata(pagy) }, each_serializer: ::PlayerGameStatisticSerializer

    # players = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
    #   Player.where(role_id: params[:role_id], team_id: params[:team_id])
    #         .where("created_at >= ? AND created_at <= ?", params[:start_date], params[:end_date])
    #         .order(rate: :desc)
    #         .select(:id, :name, :rate, :role_id)
    # end
    #
    # paginated_players = pagy(players, items: params[:limit] || 5)
    #
    # render json: {
    #   players: paginated_players.as_json(only: [:id, :name, :rate, :role_id]),
    # }
  end

  private

  def cache_key
    "top_players/#{params[:team_id]}/#{params[:role_id]}/#{params[:start_date]}_#{params[:end_date]}"
  end
end