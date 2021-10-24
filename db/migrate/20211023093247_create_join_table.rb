class CreateJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :badges, :users do |t|
      t.index :badge_id
      t.index :user_id
    end
  end
end
