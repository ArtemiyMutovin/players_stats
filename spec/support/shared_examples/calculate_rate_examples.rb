# frozen_string_literal: true

RSpec.shared_examples 'a statistics calculator' do |metrics, expected_rate|
  let(:statistic) { described_class.new(metrics:) }

  it 'calculates the correct rate' do
    expect(statistic.calculate_rate).to eq(expected_rate)
  end
end
