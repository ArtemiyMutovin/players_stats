# frozen_string_literal: true

module PlayerGameStatistics
  class CreateJob
    include Sidekiq::Job

    def perform(player_id, game_id, metrics)
      PlayerGameStatistics::Create.new(player_id:, game_id:, metrics:).call
    end
  end
end
