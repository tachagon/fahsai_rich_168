class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  protected

  	def configure_permitted_parameters
		  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
		    user_params.permit(
		    	:email,
		    	:password,
		    	:password_confirmation,
		    	:remember_me,
		    	:iden_number,
		    	:first_name,
		    	:last_name,
		    	:address,
		    	:district_id,
		    	:amphur_id,
		    	:province_id,
		    	:zipcode_id,
		    	:phone_number,
		    	:line_id,
		    	:birthday,
		    	:gender
				)
		  end

		  devise_parameter_sanitizer.permit(:account_update) do |user_params|
		    user_params.permit(
		    	:email,
		    	:password,
		    	:password_confirmation,
		    	:current_password,
		    	:first_name,
		    	:last_name,
		    	:address,
		    	:district_id,
		    	:amphur_id,
		    	:province_id,
		    	:zipcode_id,
		    	:phone_number,
		    	:line_id,
		    	:birthday,
		    	:gender
		    )
			end
  	end

end
