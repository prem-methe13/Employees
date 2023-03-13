class UserShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :gender, :mobileNo, :designation, :manager

  def manager
    object.manager ? object.manager.as_json(only: %i[id name email]) : {}
  end
end
