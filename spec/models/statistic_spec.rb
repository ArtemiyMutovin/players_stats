# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistic do
  it { is_expected.to validate_presence_of(:metrics) }

  # describe 'validate type uniqueness' do
  #   before { create(:statistic) }
  #
  #   it { is_expected.to validate_uniqueness_of(:type) }
  # end
end
