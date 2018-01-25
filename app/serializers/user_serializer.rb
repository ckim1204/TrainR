class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :sex, :birthdate, :height, :weight
end
