class ProjectsController < ApplicationController
	def index
		@p = Project.all
	end
	def new
		@p = Project.new()
	end
	def show
		@p = Project.find(params[:id])
	end
	def edit
		@p = Project.find(params[:id])
	end
	def create
		@p = Project.new(project_params)
		if @p.save
			redirect_to @p
		else
			render :new
		end
	end
	def update
		@p = Project.find(params[:id])
		if @p.update(project_params)
			redirect_to @p
		else
			render :edit
		end
	end
	private
	def project_params
		params.require(:project).permit(:name,:description)
	end
end
