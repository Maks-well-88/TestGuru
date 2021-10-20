class FeedbackMailer < ApplicationMailer
  before_action :set_admin

  def feedback(feedback)
    @title = feedback[:title]
    @body = feedback[:body]
    @user = feedback[:user]

    mail to: @admin.email, subject: "#{@title}"
  end

  private

  def set_admin
    @admin = Admin.first
  end
end
