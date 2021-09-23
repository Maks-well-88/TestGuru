class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
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

  def email_format?
    self.email.match(/VALID_EMAIL_REGEX/)
  end

  def password_digest_blank?
    self.password_digest.blank?
  end
end
