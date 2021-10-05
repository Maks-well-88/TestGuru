class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    options = params[:answer_ids]
    if options.nil?
      flash.now[:danger] = t('.no_answer')
    else
      @test_passage.accept!(params[:answer_ids])
    end

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

    current_user.gists.create(question: @test_passage.current_question, url: result.html_url )

    flash_options = if new_gist.success?
      { notice: t('.success', url: result.html_url) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
