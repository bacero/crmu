class ClientPropertiesController < ApplicationController
	def new
		@ca = ClientProperty.new()
	end
	def create
		p=params[:client_property]
		p=p[:client_id]
		@c = Client.find(p)
		@ct = ClientProperty.new(ca_params)
		if @ct.save
			redirect_to @c
		end
	end

	private
	def ca_params
		params.require(:client_property).permit(:value,:property_id,:client_id)
	end
end
