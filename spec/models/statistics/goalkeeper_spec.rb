# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistics::Goalkeeper do
  include_examples 'a statistics calculator',
                   { saves: 7, penalties_saved: 1, catches: 3 },
                   (7 * 3) + (1 * 2) + (3 * 1)
end
