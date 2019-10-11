class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def index
    @games = Game.available
  end
  
end
