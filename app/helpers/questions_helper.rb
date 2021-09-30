module QuestionsHelper
  def question_header(question)
    question.persisted? ? t('edit_question', test: @question.test.title) : t('new_question', test: @question.test.title)
  end
end
