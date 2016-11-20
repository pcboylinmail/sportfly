class AskingsController < ApplicationController
  def create
    @live_show = LiveShow.find(params[:live_show_id])
    @question = @live_show.questions.find(params[:question_id])
    #current_user.wonder_questions << @question
    @asking = Asking.create(:user_id => current_user.id, :question_id => @question.id)
    #@wonder_count = Asking.where(:question_id => params[:question_id]).count
    #有Question的欄位users_count可以計算
  end
end