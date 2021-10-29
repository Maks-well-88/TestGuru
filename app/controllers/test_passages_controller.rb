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

    if @test_passage.completed? || @test_passage.is_over?
      message = BadgeService.new(@test_passage).call
      flash[:success] = message if message != nil
      flash[:alert] = t('.time_is_over') if @test_passage.is_over?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

    if new_gist.success?
      flash_options = { notice: t('.success', url: result.html_url) }

      current_user.gists.create(question: @test_passage.current_question, url: result.html_url )
    else
      flash_options = { alert: t('.failure') }
    end
      redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
