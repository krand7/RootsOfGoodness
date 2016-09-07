class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin!
	
  def index
  	render layout: 'application_brown'
  end
end
