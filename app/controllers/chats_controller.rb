class ChatsController < ApplicationController

  def create
    @chat = Chat.new(:user_id => current_user.id,
                     :live_show_id => params[:live_show_id],
                     :content => params[:content])

  end

end
