class BoardgamesController < ApplicationController
  require 'json'
  require 'open-uri'
  before_action :set_boardgame, only: [:show, :update, :edit, :destroy]
  def index
    @boardgames = Boardgame.all
    @boardgame = Boardgame.new
  end

  def search
    @boardgame_name = params[:boardgame][:name]
    parse_result(@boardgame_name)
    @games_result = @boardgames_hash["games"]
  end

  def show
    @categories = Boardgamescategory.where(boardgame: @boardgame)
    @mechanics = Boardgamesmechanic.where(boardgame: @boardgame)
    @images = Image.where(boardgame: @boardgame)
    @video = Video.where(boardgame: @boardgame).order(:views).first
    @owners = @boardgame.users
  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    @boardgame = Boardgame.new(
      name: params["name"],
      year_published: params["year_published"],
      min_players: params["min_players"],
      max_players: params["max_players"],
      min_playtime: params["min_playtime"],
      max_playtime: params["max_playtime"],
      min_age: params["min_age"],
      description: params["description"],
      img_url: params["image_url"],
      thumb_url: params["thumb_url"],
      url: params["url"],
      bga_id: params["id"]
      )
    create_mechanics(@boardgame) unless params["mechanics"].blank?
    create_categories(@boardgame) unless params["categories"].blank?
    link_video(@boardgame)
    link_images(@boardgame)
    if current_user.present?
      create_usersboardgame(@boardgame)
      @boardgame.save
      flash[:notice] = "#{@boardgame.name} has been added"
      redirect_to root_path
    else
      flash[:notice] = "Please sign in to save a boardgame"
      redirect_to new_user_session_path
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @boardgame.destroy
    flash[:alert] = "#{@boardgame.name} has been removed"
    redirect_to root_path
  end


  private

  def set_boardgame
    @boardgame = Boardgame.friendly.find(params[:id])
  end

  def create_mechanics(boardgame)
    params["mechanics"].each do |mech|
      mech_attr = Mechanic.find_by(bga_id: mech["id"])
      Boardgamesmechanic.create(boardgame: boardgame, mechanic: mech_attr)
    end
  end

  def create_categories(boardgame)
    params["categories"].each do |category|
      category_attr = Category.find_by(bga_id: category["id"])
      Boardgamescategory.create(boardgame: boardgame, category: category_attr)
    end
  end

  def create_usersboardgame(boardgame)
    Usersboardgame.create(boardgame: boardgame, user: current_user)
  end

  def parse_result(boardgame_name)
    url = "https://www.boardgameatlas.com/api/search?name=#{boardgame_name}&limit=30&pretty=true&client_id=p4PR6A8SOV"
    url_result = open(url).read
    @boardgames_hash = JSON.parse(url_result)
  end

  def link_images(boardgame)
    url = "https://www.boardgameatlas.com/api/game/images?game_id=#{boardgame.bga_id}&pretty=true&limit=20&client_id=p4PR6A8SOV"
    url_result = open(url).read
    images_hash = JSON.parse(url_result)
    unless images_hash["images"].blank?
      images_hash["images"].each do |image|
        Image.create(
          url: image["url"],
          thumb: image["thumb"],
          small: image["small"],
          medium: image["medium"],
          large: image["large"],
          original: image["original"],
          bga_id: image["id"],
          boardgame: boardgame
          )
      end
    end
  end


  def link_video(boardgame)
    url = "https://www.boardgameatlas.com/api/game/videos?game_id=#{boardgame.bga_id}&pretty=true&limit=20&client_id=p4PR6A8SOV"
    url_result = open(url).read
    videos_hash = JSON.parse(url_result)
    videos_hash["videos"].each do |video|
      Video.create(
        url: video["url"],
        title: video["title"],
        channel_name: video["channel_name"],
        thumb_url: video["thumb_url"],
        image_url: video["image_url"],
        bga_id: video["id"],
        views: video["views"],
        boardgame: boardgame
        )
    end
  end
  def boardgame_params
    params.require(@boardgame).permit(:name, :year_published, :min_players,
                                      :max_players, :min_playtime, :max_playtime,
                                      :min_age, :description, :img_url,
                                      :thumb_url, :url)
  end
end
