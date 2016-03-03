class LaborCommentsController < ApplicationController
	def create
		@co=LaborComment.new(comment_params)
		@co.save
		p=params[:labor_comment]
		la=p[:labor_id]
		@a = Labor.find(la)
		redirect_to @a
		
		
	end
	private
	def comment_params
		params.require(:labor_comment).permit(:description,:kind,:labor_id)
	end
end
