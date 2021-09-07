class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    if question.answers.count >= 4
      errors.add(:answers_count, 'can have no more than 4 answers')
    end
  end
end
