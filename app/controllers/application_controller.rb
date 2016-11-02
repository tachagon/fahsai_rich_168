class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  	flash[:success] = "Welcome to Application Index"
  end
end
