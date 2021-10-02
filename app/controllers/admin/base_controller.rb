class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!

    unless current_user.admin?
      flash[:danger] = "Нет права доступа к запрашиваемой странице."
      redirect_to root_path 
    end
  end
end
