class User < ApplicationRecord
  enum designation: {
         employee: "Employee",
         manager: "Manager",
         hr: "HR",
         admin: "ADMIN"
       }

  enum gender: { Male: 0, Female: 1, Other: 2 }
  has_secure_password

  belongs_to :manager, class_name: "User", optional: true
  has_many :users, class_name: "User", foreign_key: "manager_id"

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :mobileNo,
            presence: true,
            uniqueness: true,
            length: {
              minimum: 10,
              maximum: 10
            }
end
