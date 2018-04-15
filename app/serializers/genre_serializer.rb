class GenreSerializer < ActiveModel::Serializer
  attributes :id, :title, :code, :url
end
