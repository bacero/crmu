class AreasController < ApplicationController
	def index
		@area = Area.all
	end
	def new
		@area = Area.new()
	end
	def create
		@area=Area.new(area_params)
		if @area.save
			redirect_to @area
		else
			render :new
		end
	end
	def show
		@area=Area.find(params[:id])
		@group=AreaGroup.new()
		@aims = AreaAim.where('area_id='+params[:id])		
		@aim = AreaAim.new()
	end
	def edit
		@area=Area.find(params[:id])
	end
	def update
		@area=Area.find(params[:id])
		if @area.update(area_params)
			redirect_to @area
		else
			render :edit
		end
	end
	private
	def area_params
		params.require(:area).permit(:name,:description,:creator)
	end
end
