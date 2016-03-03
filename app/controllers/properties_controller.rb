class PropertiesController < ApplicationController
	def index
		@p = Property.all
	end
	#:id
	def show
		@p = Property.find(params[:id])
	end
	def new
		@p = Property.new()
	end
	def edit
		@p = Property.find(params[:id])
	end
	#POST
	def create
		@p=Property.new(property_params)
		if @p.save
			redirect_to @p
		else
			render :new
		end
	end
	def update
		@p = Property.find(params[:id])
		if @p.update(property_params)
			redirect_to @p
		else
			render :edit
		end
	end
	def destroy
		@p=Property.find(params[:id])
		@p.destroy
		redirect_to properties_path
	end
	private
	def property_params
		params.require(:property).permit(:name,:description,:state_id,:kind_property_id)
	end
end
