class UsersController < ApplicationController

 def index
   @user = User.find(current_user.id)
   @game_new = Game.new
   @users = User.all
   @games = Game.all
 end

 def show
   @user = User.find(params[:id])
   @games = @user.games
   @game_new = Game.new(user_id: @user.id)

 end

 def edit
   @user = User.find(params[:id])
   if current_user != @user
     redirect_to user_path(current_user)
   end
 end

 def update
   @games = Game.all
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(current_user)
   else
     flash[:notice] = "Errors prohibited this obj from being saved:"
     render :edit
   end
 end

private

 def game_params
   params.require(:game).permit(:title, :body, :game_image)
 end

 def user_params
   params.require(:user).permit(:name, :profile_image, :introduction, :user_id)
 end

end
