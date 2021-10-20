class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.any?
      current_user.tests.push(@test)
      flash[:warning] = t('.good_luck')
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, alert: t('.impossible')
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
