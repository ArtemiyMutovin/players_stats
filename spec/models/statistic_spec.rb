# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistic do
  it { is_expected.to validate_presence_of(:metrics) }
end
