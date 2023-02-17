class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :mobileNo, :gender, :bloodGrp, :manager_id
end
