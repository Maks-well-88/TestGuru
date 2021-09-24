class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true, name: 'unique_emails'
  end
end
