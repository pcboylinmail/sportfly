class LikesController < ApplicationController
  def like
  	@question = Question.find(params[:id])
  	@like = current_user.likes.build(@question)

  	redirect_to question_path(@question)
  end

  def unlike
  	@question = Question.find(params[:id])
  	@like = current_user.likes.find_by_id(params[:id])
  	@like.destroy

  	redirect_to question_path(@question)
  	
  end
end
