class PagesController < ApplicationController
  def home
    @boardgames = Boardgame.all
    @boardgame = Boardgame.new
  end
end
