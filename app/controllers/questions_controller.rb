class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index show]
  before_action :find_question, only: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  #Просмотра списка вопросов теста
  def index
    render inline: "<%= @test.questions.each { |question| question } %>"
  end

  def show
    render inline: "<%= @test.questions.find(@question.id).body %>"
  end

  def new
  end

  def create
    @question = Question.create(question_params)
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: "Question not found!"
  end
end
