class ApplicationController < ActionController::Base
	before_action :authenticate_user!

  protect_from_forgery with: :exception

  def index
  	flash.now[:success] = "Welcome to Application Index"
  end
end
