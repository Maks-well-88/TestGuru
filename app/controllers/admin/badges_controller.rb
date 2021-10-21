class Admin::BadgesController < Admin::BaseController
  before_action :set_images, only: %i[new edit]
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      flash[:success] = "Награда успешно создана"
      redirect_to badges_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to badges_path, notice: "Награда успешно обновлена!"
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_path, notice: "Награда успешно удалена!"
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def set_images
    @images = Dir.glob("./app/assets/images/**/*").select { |e| File.file? e }
    @images.map! { |image| image.split('/').last }
  end

  def badge_params
    params.require(:badge).permit(:title, :img_name, :rule, :description)
  end
end
