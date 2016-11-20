class AmphursController < ApplicationController
	def index
		@province = Province.find(params[:province_id])
		render json: @province.amphurs
	end
end
