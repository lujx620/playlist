class UsersController < ApplicationController
  before_action :require_login, only:[:show, :favorites, :playlist]
  def create
    @user= User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    if @user.valid?
      session[:user_id]= @user.id
      redirect_to "/songs"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end
  def show
    @songs = Song.order('created_at DESC')
    # @songs= Song.all
  end

  def favorites
    @user = User.find(session[:user_id])
    @song = Song.find(params[:id])
    Favorite.create(user:@user, song:@song)
    redirect_to :back
  end

  def playlist
    @user = User.find(params[:id])
    @songs = Favorite.where('user_id=?', @user.id)

  end
end
