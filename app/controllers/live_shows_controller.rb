class LiveShowsController < ApplicationController
  def index
    @live_shows = LiveShow.includes(:user)
  end

  def show
    @user = User.find(params[:user_id])
    @live_show = @user.live_shows.find(params[:id])
    @live_shows = @user.live_shows
  end
end
