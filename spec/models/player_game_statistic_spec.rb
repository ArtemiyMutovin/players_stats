# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayerGameStatistic do
  it { is_expected.to belong_to :player }
  it { is_expected.to belong_to :game }
  it { is_expected.to belong_to :statistic }
end
