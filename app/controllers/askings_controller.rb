class AskingsController < ApplicationController

	def create
		@question = Question.find(params[:question_id])
		@live_show = LiveShow.find(params[:live_show_id])
	  	@asking = current_user.askings.build(:question_id => @question.id)
	  	@asking.save
	  	respond_to do |format|
	      format.html {redirect_to live_show_path(@live_show) }
	      format.json{render :json=> {:message => "ok"}}
	      format.js
	    end
    end
	  	
	
	def destroy
		@question = Question.find(params[:question_id])
	  	@asking = current_user.askings.find_by_question_id(params[:question_id])
	  	@asking.destroy
		respond_to do |format|
	      format.html {redirect_to live_show_path(@live_show) }
	      format.json{render :json=> {:message => "ok"}}
	      format.js
	    end
	end
	private

	def asking_params
		params.require(:asking).permit(:user_id, :question_id)
	end

end
