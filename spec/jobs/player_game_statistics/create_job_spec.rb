# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayerGameStatistics::CreateJob do
  let(:player_id) { 200 }
  let(:game_id) { 100 }
  let(:metrics) { { points: 30, assists: 5 } }

  it 'calls PlayerGameStatistics::Create with correct parameters' do
    create_service = instance_double(PlayerGameStatistics::Create)
    allow(PlayerGameStatistics::Create).to receive(:new).with(player_id:, game_id:,
                                                              metrics:).and_return(create_service)
    expect(create_service).to receive(:call)

    described_class.new.perform(player_id, game_id, metrics)
  end
end
