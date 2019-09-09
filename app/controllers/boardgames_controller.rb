class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: [:show, :update, :edit, :destroy]
  def index
    @boardgames = Boardgame.all
  end

  def show
    @categories = Boardgamescategory.where(boardgame: @boardgame)
  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    @boardgame = Boardgame.create(boardgame_params)
  end

  def update
  end

  def edit
  end

  def destroy
    @boardgame.destroy
  end


  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:id])
  end

  def boardgame_params
    params.require(@boardgame).permit(:name, :year_published, :min_players,
                                      :max_players, :min_playtime, :max_playtime,
                                      :min_age, :description, :desc_short,
                                      :img_url, :thumb_url, :url)
  end
end
