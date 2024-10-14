# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistics::Defender do
  include_examples 'a statistics calculator',
                   { tackles: 5, blocked_shots: 3, interceptions: 2 },
                   (5 * 3) + (3 * 2) + (2 * 1)
end
