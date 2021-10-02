class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    flash[:warning] = t('.good_luck')
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
