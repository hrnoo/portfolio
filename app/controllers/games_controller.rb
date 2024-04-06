class GamesController < ApplicationController
def index
  @user = current_user
  @game_new = Game.new
  @games = Game.all
end

def show
  @game_new = Game.new
  @games = Game.all
  @game = Game.find(params[:id])
  @user = @game.user
end

def create
  @game_new = Game.new(game_params)
  @game_new.user_id = current_user.id
  if @game_new.save
    flash[:notice] = "You have created game successfully."
    redirect_to game_path(@game_new)
  else
    @user = current_user
    @games = Game.all
    render :index
  end
end

def edit
  @games = Game.all
  @game = Game.find(params[:id])

  unless current_user == @game.user
    redirect_to games_path
    return
  end

  render :edit
end

def update
  @game = Game.find(params[:id])

  if @game.update(game_params)
    flash[:notice] = "Game was successfully updated."
    redirect_to game_path(@game.id)
  else
    render :edit
  end
end

def destroy
  @game = Game.find(params[:id])
  if @game.destroy
    flash[:notice] = "Game was successfully destroyed."
    redirect_to games_path
  end
end

private

def set_game
  @game = Game.find(params[:id])
end

def check_authorization
  unless current_user == @game.user
    redirect_to games_path
  end
end

def game_params
  params.require(:game).permit(:title, :body, :game_image)
end

end
