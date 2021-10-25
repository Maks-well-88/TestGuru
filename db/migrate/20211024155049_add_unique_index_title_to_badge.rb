class AddUniqueIndexTitleToBadge < ActiveRecord::Migration[6.1]
  def change
    add_index :badges, :title, unique: true
  end
end
