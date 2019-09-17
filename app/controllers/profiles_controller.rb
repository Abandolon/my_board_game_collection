class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @user = params[:user_id]
  end

  def show
    @user = Profile.friendly.find(params[:id])
    @boardgames = Usersboardgame.where(user: current_user)
    @boardgame = Boardgame.new
  end

  def create
    @user = User.find(params["user_id"])
    @profile = Profile.new(profiles_params)
    @profile.user = @user
    if @profile.save
      flash[:notice] = "Your Profile has been updated"
      redirect_to boardgames_path
    else
      render :new
    end
  end

  private

  def profiles_params
    params.require(:profile).permit(:username, :image, :image_cache, :bio, :user_id)
  end

end
