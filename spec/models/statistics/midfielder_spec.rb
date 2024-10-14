# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistics::Midfielder do
  include_examples 'a statistics calculator',
                   { freekicks: 1, crosses: 4, passes: 6 },
                   (1 * 3) + (4 * 2) + (6 * 1)
end
