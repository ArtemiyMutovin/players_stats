# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistics::Forward do
  include_examples 'a statistics calculator',
                   { goals: 4, assists: 2, shots: 5 },
                   (4 * 3) + (2 * 2) + (5 * 1)
end
