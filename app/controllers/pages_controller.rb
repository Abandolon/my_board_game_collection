class PagesController < ApplicationController
  def home
    @boardgames = Boardgame.order(view: :desc).limit(5)

    @boardgame = Boardgame.new
  end
end
