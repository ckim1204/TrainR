class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password_digest, :email, :sex, :birthdate, :height, :weight, :musclegroup_plan
end
