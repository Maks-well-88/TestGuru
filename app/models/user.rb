class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test'

  validates :email, presence: true
  validates :password, presence: true, if: :password_digest_blank?
  validates :password, confirmation: true

  scope :find_test_by_level, -> (level) {
    joins('JOIN tests ON tests.user_id = users.id')
      .where('tests.level = ?', level)
  }

  def tests_by_level(level)
    self.tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def password_digest_blank?
    self.password_digest.blank?
  end
end
