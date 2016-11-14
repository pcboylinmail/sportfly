class Api::FollowingsController < Api::ApiController
  before_action :authenticate_user!

  def create
    @live_show = LiveShow.find(params[:id])
    @own_user = @live_show.user
    @following = Following.new(:user_id => @own_user.id, :follower_id => current_user.id)
    if @following.save
        render :json => {
          :status => 200,
          :message => "create succeed",
          :following => @following
        }
    end
  end

  def destroy
    @live_show = LiveShow.find(params[:id])
    @own_user = @live_show.user
    @following = own_user.followings.find_by_follower_id(current_user.id)
    if @following.destroy
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
end