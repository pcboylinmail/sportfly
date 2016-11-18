class LiveShowsController < ApplicationController
  def index
    @live_shows = LiveShow.includes(:user)
  end

  def show
    @live_show = LiveShow.find(params[:id])
    @user = @live_show.user
    @live_shows = @user.live_shows
    @chat = Chat.new
    #@live_show.fb_url = @live_show.fb_url.split('"').second

  end
  
end
