# frozen_string_literal: true

class TopPlayerSerializer < Panko::Serializer
  attributes :id, :name, :team_id, :role_id, :average_rating

  def average_rating
    object[:average_rating].to_f.round(2)
  end
end
