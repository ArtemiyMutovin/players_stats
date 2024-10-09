# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player do
  it { is_expected.to belong_to :role }
  it { is_expected.to belong_to :team }

  it { is_expected.to validate_presence_of(:name) }
end
