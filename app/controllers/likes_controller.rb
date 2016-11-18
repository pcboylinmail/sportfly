class LikesController < ApplicationController
  def like
  	@chat = chat.find(params[:id])
  	@like = current_user.likes.build(@chat)

  	redirect_to chat_path(@chat)
  end

  def unlike
  	@chat = chat.find(params[:id])
  	@like = current_user.likes.find_by_id(params[:id])
  	@like.destroy

  	redirect_to chat_path(@chat)
  	
  end
end
