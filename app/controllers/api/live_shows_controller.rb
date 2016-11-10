class Api::LiveShowsController < Api::ApiController

  def index
    @live_shows =Live.all
    @users = User.all

    render :json => {
      :live_shows => @live_shows.map{|i|i.return_json}
    }
  end

  def show
    @user = User.find(params[:user_id])
    @live = @user.live_shows.find(params[:id])
    @live_shows = @user.live_shows
  end

  def create
    @live_show = Live_show.new(:name => params[:name])
    @live_show.user = User.first
    if @live_show.save
      render :json => {
        :status => 200,
        :message => "create succeed",
        :live_show => @live_show
      }
    end
  end
end
