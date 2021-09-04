class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :surname, :string
    add_column :users, :password, :string
    add_column :users, :administrator, :boolean, default: false
  end
end
