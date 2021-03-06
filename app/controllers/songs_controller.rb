class SongsController < ApplicationController
  before_action :require_login
  def show
    @song = Song.find(params[:id])
    @favorites =Favorite.where(song: @song)
  end
  def create
    @user= User.find(session[:user_id])
    song= Song.create(artist: params[:artist], title: params[:title], user:@user)
    if song.valid?
      redirect_to :back
    else
      flash[:errors] = song.errors.full_messages
      redirect_to :back
    end
  end

end
