class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'

  scope :find_test_by_level, -> (level) {
    joins('JOIN tests ON tests.user_id = users.id')
      .where('tests.level = ?', level)
  }

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
