class KindPropertiesController < ApplicationController
	def index
		@kp = KindProperty.all
	end
end


