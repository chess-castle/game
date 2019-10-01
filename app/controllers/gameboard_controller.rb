class GameboardController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  #eventually enable devise to stop actions without authentication prior

  def show 
  end

  def update
    @game = Game.find_by_id(params[:id])

    @game.update_attributes(game_params)
    if @gram.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end


  def game_params
    params.require(:game).permit(:black_player_id, :game_id)
  end
end
