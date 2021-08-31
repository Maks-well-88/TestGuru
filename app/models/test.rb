class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category_title)
    category = Category.where(title: category_title).first.id
    Test.where(category_id: category).pluck(:title).sort
  end
end
