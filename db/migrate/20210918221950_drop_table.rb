class DropTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :tests_users
  end
end
