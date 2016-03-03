class ClientActivitiesController < ApplicationController
	def new
		@act = ClientActivity.new()
	end
	#POST
	def create
		p=params[:client_activity]
		p=p[:client_id]
		@c = Client.find(p)
		@act=ClientActivity.new(activity_params)
		if @act.save
			redirect_to @c
		end
	end

	private
	def activity_params
		params.require(:client_activity).permit(:description,:client_id)
	end
end
