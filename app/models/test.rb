class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  has_and_belongs_to_many :users
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  def self.tests_by_category(category_title)
    joins(:category).where('categories.title = ?', category_title).pluck(:title).sort
  end
end
