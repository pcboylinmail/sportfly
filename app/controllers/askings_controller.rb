class AskingsController < ApplicationController
	def create
		@question = Question.find(params[:id])
	  	@asking = current_user.askings.build(@question)
	  	@asking.save
	  	redirect_to question_path(@question)
	end
	def destroy
		@question = Question.find(params[:id])
	  	@asking = current_user.askings.find_by_id(params[:id])
	  	@asking.destroy

	  	redirect_to question_path(@question)
	end
end
