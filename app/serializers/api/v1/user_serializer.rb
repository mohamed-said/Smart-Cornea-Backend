class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name
  has_many :domains
end
