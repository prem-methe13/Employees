class User < ApplicationRecord
  enum designation: { Employee: 0, Manager: 1, HR: 2 }

  has_many :users, class_name: "user", foreign_key: "id"
  belongs_to :managers, class_name: "user", optional: true

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :mobileNo, presence: true, uniqueness: true
end
