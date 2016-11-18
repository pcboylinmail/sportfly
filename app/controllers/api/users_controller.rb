class Api::UsersController < Api::ApiController
  before_action :authenticate_user!
  def index
    @users = User.all
    render :json => {
      :users => @users.map{|i|i.return_json}
    }
  end

  def show
    @user = User.find(params[:id])
    render :json => {
      :user => @user.return_json,
    }
  end

  def create
    @user = User.new(
                        email: params[:email],
                        channel_name: params[:channel_name],
                        description: params[:description],
                        live_owner: params[:live_owner],
                        fb_uid: params[:fb_uid],
                        fb_token: params[:fb_token],
                        fb_name: params[:fb_name],
                        fb_image: params[:fb_image],
                        fb_link: params[:fb_link],
                        gender: params[:gender],
                        authentication_token: params[:authentication_token])
    if @user.save
      render :json => {
        :status => 200,
        :message => "create succeed",
        :user => @user
      }
    else
      render :json => {
             :status => 401,
             :message => "create failed"
      }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(
                  # email: params[:email],
                  channel_name: params[:channel_name],
                  description: params[:description],
                  # live_owner: params[:live_owner],
                  # fb_uid: params[:fb_uid],
                  # fb_token: params[:fb_token],
                  # fb_name: params[:fb_name],
                  # fb_image: params[:fb_image],
                  # fb_link: params[:fb_link],
                  # gender: params[:gender],
                  # authentication_token: params[:authentication_token]
                  )
    if @user.save
      render :json => {
        :status => 200,
        :message => "update succeed",
        :user => @user
      }
    else
      render :json => {
             :status => 401,
             :message => "update failed"
      }
    end
  end
end
