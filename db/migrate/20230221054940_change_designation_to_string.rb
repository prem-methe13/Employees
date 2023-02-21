class ChangeDesignationToString < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :designation, :string
  end
end
