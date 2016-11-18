class Api::LiveShowsController < Api::ApiController
  before_action :authenticate_user!
  def index
    @live_shows = LiveShow.includes(:user)
    render :json => {
      :live_shows => @live_shows.map{|i|i.return_json}
    }
  end

  def show
    #@user = User.find(params[:id])
    @live_show = LiveShow.find(params[:id])
    #@live_shows = @user.live_shows
    render :json => {
      :live_show => @live_show.return_json,
    }
  end

  def create
    #@user = current_user
    #@live_show.user_id = @user.id
    #不確定current_user是否能這樣用
    @live_show = LiveShow.new(name: params[:name],
                              user_id: current_user.id,
                              fb_url: params[:fb_url] )
    if @live_show.save
      render :json => {
        :status => 200,
        :message => "create succeed",
        :live_show => @live_show
      }
    else
      render :json => {
             :status => 401,
             :message => "create failed"
      }
    end
  end

  def update
    @live_show = LiveShow.find(params[:id])
    @live_show.update(name:params[:name])
    if @live_show.save
      render :json => {
        :status => 200,
        :message => "update succeed",
        :live_show => @live_show
      }
    else
      render :json => {
             :status => 401,
             :message => "update failed"
      }
    end
  end

  def destroy
    @live_show = LiveShow.find(params[:id])
    if @live_show.destroy
      render :json => {
        :status => 200,
        :message => "destroy succeed"
      }
    else
      render :json => {
        :status => 401,
        :message => "destroy failed"
      }
    end
  end

  # private
  # def live_show_params
  #   params.require(:live_show).permit(:name, :user_id)
  # end
end
