class Api::LivesController < Api::ApiController

  def index
    @lives =Live.all
    @users = User.all

    render :json => {
      :lives => @lives.map{|i|i.return_json}
    }
  end

  def show
    @user = User.find(params[:user_id])
    @live = @user.lives.find(params[:id])

    # @live = Live.find(params[:id])
    # @user = @Live.user
    # @user = User.find(@live)
    @lives = @user.lives
  end

  def create
    @live = Live.new(:name => params[:name])
    @live.user = User.first
    if @live.save
      render :json => {
        :status => 200,
        :message => "create succeed",
        :live => @live
      }
    end
  end
end
