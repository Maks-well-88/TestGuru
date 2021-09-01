class AddTestUser < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tests, :users
  end
end
