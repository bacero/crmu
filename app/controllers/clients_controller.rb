class ClientsController < ApplicationController
	def index
		@client = Client.all
	end
	def new
		@client = Client.new()
	end
	def create
		@client=Client.new(client_params)
		if @client.save
			redirect_to @client
		else
			render :new
		end
	end
	def show
		@client=Client.find(params[:id])
		@ca = ClientProperty.new()
		@caa = ClientProperty.where('client_id='+params[:id])
		@act = ClientActivity.new()
		@activites = ClientActivity.where('client_id='+params[:id]).order('created_at DESC')
	end
	def edit
		@client=Client.find(params[:id])
	end

	def update
		@client=Client.find(params[:id])
		if @client.update(client_params)
			redirect_to @client
		else
			render :edit
		end
	end
	def destroy
		@client=Client.find(params[:id])
		@client.destroy
		redirect_to clients_path
	end
	private
	def client_params
		params.require(:client).permit(:name,:identity,:telephone,:address,:state_id,:type_client_id)
	end
end
