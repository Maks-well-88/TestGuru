class FeedbacksController < ApplicationController

  def new; end

  def create
    @feedback = feedback_params
    if @feedback
      @feedback[:user] = current_user.email

      FeedbackMailer.feedback(@feedback).deliver_now
      redirect_to root_path, notice: "Сообщение успешно отправлено!"
    else
      render new_feedback_path, alert: "Упс, что-то пошло не так..."
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end
end
