class TypeClientsController < ApplicationController
	def index
		@tc = TypeClient.all
	end
	def new
		@tc = TypeClient.new()
	end
	#POST
	def create
		@tc = TypeClient.new(tc_params)
		if @tc.save
			redirect_to @tc
		else
			render :new
		end
	end
	def show
		@tc = TypeClient.find(params[:id])
		@la = ListProperty.new()
		@caa = ListProperty.where('type_client_id='+params[:id])
	end

	def edit
		@tc = TypeClient.find(params[:id])
	end

	def update
		@tc = TypeClient.find(params[:id])
		if @tc.update(tc_params)
			redirect_to @tc
		else
			render :edit
		end
	end
	def destroy
		@tc=TypeClient.find(params[:id])
		@tc.destroy
		redirect_to type_clients_path
	end
	private
	def tc_params
		params.require(:type_client).permit(:name,:description,:state_id)
	end
end
