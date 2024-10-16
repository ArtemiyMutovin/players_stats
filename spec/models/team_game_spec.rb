# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TeamGame do
  it { is_expected.to belong_to :team }
  it { is_expected.to belong_to :game }
end
