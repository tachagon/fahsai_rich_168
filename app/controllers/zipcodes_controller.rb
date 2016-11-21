class ZipcodesController < ApplicationController
	def index
		@district = District.find(params[:district_id])
		render json: @district.zipcodes
	end
end
