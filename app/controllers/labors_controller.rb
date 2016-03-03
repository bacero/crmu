class LaborsController < ApplicationController
	def create
		@labor=Labor.new(labor_params)
		if @labor.save
			redirect_to @labor
		else
			render :new
		end
	end
	def edit
		@labor=Labor.find(params[:id])
	end
	def update
		@labor=Labor.find(params[:id])

		if @labor.name != params[:labor][:name]
			change = LaborChange.new(:property => "Nombre", :previus => @labor.name,:mint=>params[:labor][:name],:labor_id=>params[:id])
			change.save
		end
		if @labor.description != params[:labor][:description]
			change = LaborChange.new(:property => "Descripcion", :previus => @labor.description,:mint=>params[:labor][:description],:labor_id=>params[:id])
			change.save
		end
		if @labor.indicator_description != params[:labor][:indicator_description]
			change = LaborChange.new(:property => "Descripcion Indicador", :previus => @labor.indicator_description,:mint=>params[:labor][:indicator_description],:labor_id=>params[:id])
			change.save
		end
		if @labor.indicator != params[:labor][:indicator]
			change = LaborChange.new(:property => "Indicador", :previus => @labor.indicator,:mint=>params[:labor][:indicator],:labor_id=>params[:id])
			change.save
		end
		if @labor.ending != params[:labor][:ending]
			change = LaborChange.new(:property => "Inicio", :previus => @labor.ending,:mint=>params[:labor][:ending],:labor_id=>params[:id])
			change.save
		end
		if @labor.initiation != params[:labor][:initiation]
			change = LaborChange.new(:property => "Finalizacion", :previus => @labor.initiation,:mint=>params[:labor][:initiation],:labor_id=>params[:id])
			change.save
		end

		if @labor.update(labor_params)
			redirect_to @labor
		else
			render :edit
		end
		
	end
	def show
		@labor = Labor.find(params[:id])
		@changes= LaborChange.where('labor_id='+params[:id])
		@observations=LaborComment.where(["labor_id = "+params[:id]+" and kind = 1"])
		@comment=LaborComment.new()
		@comnents=LaborComment.where(["labor_id = "+params[:id]+" and kind = 2"])
	end
	private
	def labor_params
		params.require(:labor).permit(:name,:description,:indicator,:indicator_description,:ending,:initiation,:area_aim_id,:project_id,:state_id,:client_id)
	end
end
