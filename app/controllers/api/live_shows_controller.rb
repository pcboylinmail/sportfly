class Api::LiveShowsController < Api::ApiController

  def index
    @live_shows =LiveShow.includes(:user)
    render :json => {
      :live_shows => @live_shows.map{|i|i.return_json}
    }
  end

  def show
    @user = User.find(params[:user_id])
    @live_show = @user.live_shows.find(params[:id])
    @live_shows = @user.live_shows
    render :json => {
      :live_show => @live_show,
      :live_show_user => @live_show.user,
      :live_show_questions => @live_show.questions.map{|i|i.return_json},
      :live_show_chats => @live_show.chats.map{|i|i.return_json}
    }
  end

  def create
    #@user = current_user
    #@live_show.user_id = @user.id
    @live_show = LiveShow.new(name:params[:name], user_id:params[:user_id])
    if @live_show.save
      render :json => {
        :status => 200,
        :message => "create succeed",
        :live_show => @live_show
      }
    end
  end

  # private
  # def live_show_params
  #   params.require(:live_show).permit(:name, :user_id)
  # end
end
