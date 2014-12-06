class Api::V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_one :author
  has_one :user
end
