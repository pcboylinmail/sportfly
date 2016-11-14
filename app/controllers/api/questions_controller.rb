class Api::QuestionsController < Api::ApiController
  #before_action :authenticate_user!
  def index
    @live_show = LiveShow.find(params[:live_show_id])
    @questions = @live_show.questions
    render :json => {
      :live_show => @live_show.return_json,
      :questions => @questions.map{|i|i.return_json}
    }
  end

  def destroy
    @live_show = LiveShow.find(params[:live_show_id])
    @question = @live_show.questions.find(params[:id])
    if @question.destroy
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
