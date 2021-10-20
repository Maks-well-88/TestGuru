class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true, uniqueness: {scope: :level}
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :find_by_category_title, -> (category_title) {
    joins('JOIN categories ON tests.category_id = categories.id')
      .where('categories.title = ?', category_title)
  }

  scope :find_by_level, -> (level) { where(level: level) }
  scope :easy, -> { find_by_level(0..1) }
  scope :medium, -> { find_by_level(2..4) }
  scope :hard, -> { find_by_level(5..Float::INFINITY) }

  def self.tests_by_category(category_title)
    find_by_category_title(category_title).pluck(:title).sort
  end
end
