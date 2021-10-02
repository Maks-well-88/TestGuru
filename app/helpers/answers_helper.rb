module AnswersHelper
  def answer_header(answer)
    answer.persisted? ? t('edit_answer', question: @answer.question.body) : t('new_answer', question: @answer.question.body)
  end

  def correct_answer(type_of_answer)
    case type_of_answer
    when false then t('not_correct')
    when true then t('correct')
    end
  end
end
