module AnswersHelper
  def answer_header(answer)
    answer.persisted? ? "Редактировать ответ к вопросу: #{@answer.question.body}" : "Новый ответ к вопросу: #{@answer.question.body}"
  end

  def correct_answer(type_of_answer)
    case type_of_answer
    when false then 'не правильный'
    when true then 'правильный'
    end
  end
end
