class DistrictsController < ApplicationController
	def index
		@amphur = Amphur.find(params[:amphur_id])
		render json: @amphur.districts
	end
end
