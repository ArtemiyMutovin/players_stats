# frozen_string_literal: true

module PlayerGameStatistics
  class Create
    def initialize(game_id:, player_id:, metrics:)
      @game_id = game_id
      @player_id = player_id
      @metrics = metrics
    end

    def call
      create_statistic! if valid?
    end

    private

    def create_statistic!
      player_statistic_klass = "Statistics::#{player.role.name}".constantize
      statistic = player_statistic_klass.create!(metrics: @metrics)
      calculated_rate = statistic.calculate_rate
      team = player.team
      PlayerGameStatistic.create(player:, game:, team:, statistic:, rate: calculated_rate)
    end

    def valid?
      @game_id.present? && @player_id.present? && @metrics.present?
    end

    def player
      @player ||= Player.find(@player_id)
    end

    def game
      @game ||= Game.find(@game_id)
    end
  end
end
