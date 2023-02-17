class User < ApplicationRecord
  enum designation: { Employee: 0, Manager: 1, HR: 2, ADMIN: 3 }

  belongs_to :manager, class_name: "User", optional: true
  has_many :users, class_name: "User", foreign_key: "manager_id"

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :mobileNo, presence: true, uniqueness: true
end
