class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render :json => {
      :users => @users.map{|i|i.return_json}
    }
  end
end
