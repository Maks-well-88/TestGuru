class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: :create
  before_update :before_update_set_next_question

  PASSAGE_THRESHOLD = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def count_number_of_questions
    if test.questions.index(current_question).nil?
      test.questions.count + 1
    else
      test.questions.index(current_question).next
    end
  end

  def success?
    success_percentage >= PASSAGE_THRESHOLD
  end

  def success_percentage
    (correct_questions.to_f / test.questions.count * 100).round(0)
  end

  def count_persentage
    ((count_number_of_questions - 1) / test.questions.count.to_f * 100).round(0)
  end

  private

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_current_question
    self.current_question = test.questions.first
  end
end
