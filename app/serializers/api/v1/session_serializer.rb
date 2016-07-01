class Api::V1::SessionSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :token

  def token
    object.authentication_token
  end
end
