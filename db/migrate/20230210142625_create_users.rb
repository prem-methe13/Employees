class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.date :dob
      t.string :mobileNo
      t.string :bloodGrp
      t.string :gender

      t.timestamps
    end
  end
end
