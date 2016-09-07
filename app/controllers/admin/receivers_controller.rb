class Admin::ReceiversController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin!
  before_action :set_receiver, only: [:show, :edit, :update, :destroy]

  def index
  	@receivers = Receiver.current
    render layout: 'application_brown'
  end

  def show
    render layout: 'application_brown'
  end

  private

  def set_receiver
  	@receiver = Receiver.find(params[:id])
  end
end
