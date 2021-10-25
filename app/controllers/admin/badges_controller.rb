class Admin::BadgesController < Admin::BaseController
  before_action :set_images, only: %i[new edit update create]
  before_action :set_badge, only: %i[edit update destroy]
  before_action :set_rule, only: %i[new edit update create]

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      flash[:success] = t('.success')
      redirect_to badges_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to badges_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_path, notice: t('.deleted')
  end

  private

  def set_rule
    @rules = Badge::RULES
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_images
    @images = Dir.glob("./app/assets/images/**/*").select { |e| File.file? e }
    @images.map! { |image| image.split('/').last }
  end

  def badge_params
    params.require(:badge).permit(:title, :img_name, :rule, :rule_value, :description)
  end
end
