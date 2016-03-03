class ListPropertiesController < ApplicationController
	def new
		@la = ListProperty.new()
	end
	def create
		
		@a=params[:property_id]
		@t=params[:list_property]
		@t=@t[:type_client_id]
		@a.each do |s|
			@tr=ListProperty.new(property_id:s,type_client_id:@t)
			@tr.save
		end
		@tc = TypeClient.find(@t)
		redirect_to @tc

	end
	private
	def attribute_params
		params.require(:list_property).permit(:property_id,:type_clien_id)
	end
end
