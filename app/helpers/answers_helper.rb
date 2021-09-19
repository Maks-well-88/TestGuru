module AnswersHelper
  def answer_header(answer)
    answer.persisted? ? "Редактировать ответ к вопросу: #{@answer.question.body}" : "Новый ответ к вопросу: #{@answer.question.body}"
  end

  def correct_answer(answer)
    case answer
    when false then 'не правильный'
    when true then 'правильный'
    end
  end
end
