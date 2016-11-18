class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # if params[:delete_pic]=="1"
    #   @user.picture = nil
    # end
    if @user == current_user
       @user.update(user_params)
       flash[:notice] = "更新成功"
       redirect_to live_shows_path
    elsif @user != current_user
       flash[:alert]="沒有權限"
       render :action => :edit
    else
       flash[:alert]="更新失敗"
       render :action => :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:picture)
  end

end
