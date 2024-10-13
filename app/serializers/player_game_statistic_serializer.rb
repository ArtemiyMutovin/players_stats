class PlayerGameStatisticSerializer < ActiveModel::Serializer
  attributes :id, :average_rating

  def average_rating
    object.average_rating.to_f.round(2)
  end
end