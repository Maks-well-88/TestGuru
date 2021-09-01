class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category_title)
    joins(:category).where('categories.title = ?', category_title).pluck(:title).sort
  end
end
