class AddFirstnameAndLastnameToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end
