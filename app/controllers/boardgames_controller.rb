class BoardgamesController < ApplicationController
  require 'json'
  require 'open-uri'
  before_action :set_boardgame, only: [:show, :update, :edit, :destroy]
  def index
    @boardgames = Boardgame.all
    @boardgame = Boardgame.new
  end

  def show
    @categories = Boardgamescategory.where(boardgame: @boardgame)
    @mechanics = Boardgamesmechanic.where(boardgame: @boardgame)
  end

  def new
    @boardgame = Boardgame.new
  end

  def create
    boardgame_name = params[:boardgame][:name]
    url = "https://www.boardgameatlas.com/api/search?name=#{boardgame_name}&pretty=true&client_id=p4PR6A8SOV"
    url_result = open(url).read
    boardgames_hash = JSON.parse(url_result)
    @first_boardgame = boardgames_hash["games"].first
    @boardgame = Boardgame.create(
      name: @first_boardgame["name"],
      year_published: @first_boardgame["year_published"],
      min_players: @first_boardgame["min_players"],
      max_players: @first_boardgame["max_players"],
      min_playtime: @first_boardgame["min_playtime"],
      max_playtime: @first_boardgame["max_playtime"],
      min_age: @first_boardgame["min_age"],
      description: @first_boardgame["description"],
      desc_short: @first_boardgame["description_preview"],
      img_url: @first_boardgame["image_url"],
      thumb_url: @first_boardgame["thumb_url"],
      url: @first_boardgame["url"]
    )
    create_mechanics(@boardgame) unless @first_boardgame["mechanics"].blank?
    create_categories(@boardgame) unless @first_boardgame["categories"].blank?
    redirect_to root_path
  end

  def update
  end

  def edit
  end

  def destroy
    @boardgame.destroy
    redirect_to root_path
  end


  private

  def set_boardgame
    @boardgame = Boardgame.find(params[:id])
  end

  def create_mechanics(boardgame)
    @first_boardgame["mechanics"].each do |mech|
      mech_attr = Mechanic.find_by(bga_id: mech["id"])
      Boardgamesmechanic.create(boardgame: boardgame, mechanic: mech_attr)
    end
  end

  def create_categories(boardgame)
    @first_boardgame["categories"].each do |category|
      category_attr = Category.find_by(bga_id: category["id"])
      Boardgamescategory.create(boardgame: boardgame, category: category_attr)
    end
  end


  def boardgame_params
    params.require(@boardgame).permit(:name, :year_published, :min_players,
                                      :max_players, :min_playtime, :max_playtime,
                                      :min_age, :description, :desc_short,
                                      :img_url, :thumb_url, :url)
  end
end
