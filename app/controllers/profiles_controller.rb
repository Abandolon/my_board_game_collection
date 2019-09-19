class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @user = params[:user_id]
  end

  def show
    @profile = Profile.friendly.find(params[:id])
    @boardgames = @profile.user.boardgames.order(:name)
    @boardgame = Boardgame.new
  end

  def create
    @profile = Profile.new(profiles_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = "Your Profile has been updated"
      redirect_to boardgames_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.friendly.find(params[:id])
  end

  def update
    @profile = Profile.friendly.find(params[:id])
    @profile.update(profiles_params)
    flash[:notice] = "Your Profile has been updated"
    redirect_to boardgames_path
  end

  private

  def profiles_params
    params.require(:profile).permit(:username, :image, :image_cache, :bio,
                                    :user_id, :city, :country)
  end

end
