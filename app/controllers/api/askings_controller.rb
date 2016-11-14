class Api::AskingsController < Api::ApiController
  #before_action :authenticate_user!

  def create
    @live_show = LiveShow.find(params[:live_show_id])
    @question = @live_show.questions.find(params[:question_id])
    #current_user.wonder_questions << @question
    @asking = Asking.new(:user_id => current_user.id, :question_id => @question.id)
    @wonder_count = Asking.where(:question_id => params[:question_id]).count
    if @asking.save
        render :json => {
          :status => 200,
          :message => "create succeed",
          :asking => @asking,
          :wonder_count => @wonder_count
        }
    end
  end

  def destroy
    @live_show = LiveShow.find(params[:live_show_id])
    @question = @live_show.questions.find(params[:question_id])
    @asking = current_user.askings.find_by_question_id(@question.id)
    if @asking.destroy
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
