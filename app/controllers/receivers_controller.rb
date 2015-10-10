class ReceiversController < ApplicationController
  before_action :set_receiver, only: [:show, :edit, :update, :destroy]
  before_action :check_for_existing_receiver, only: [:create]

  # GET /receivers
  # GET /receivers.json
  def index
    @receivers = Receiver.current.order(trees: :desc)
  end

  # GET /receivers/1
  # GET /receivers/1.json
  def show
  end

  # GET /receivers/new
  def new
    @receiver = Receiver.new
    render layout: 'application_creation'
  end

  # GET /receivers/1/edit
  def edit
    redirect_to @receiver
  end

  # POST /receivers
  # POST /receivers.json
  def create
    if @existing_receiver.present?
      redirect_to new_receiver_tribute_path(@existing_receiver)
    else
      @receiver = Receiver.new(receiver_params)
      if @receiver.save
        redirect_to new_receiver_tribute_path(@receiver)
      else
        render :new
      end
    end
  end

  # PATCH/PUT /receivers/1
  # PATCH/PUT /receivers/1.json
  def update
    if @receiver.update(receiver_params)
      redirect_to @receiver, notice: 'Receiver was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /receivers/1
  # DELETE /receivers/1.json
  def destroy
    @receiver.destroy
    redirect_to receivers_url, notice: 'Receiver was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = Receiver.find(params[:id])
    end

    def check_for_existing_receiver
      @existing_receiver = Receiver.find_by_name(params[:receiver][:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receiver_params
      params.require(:receiver).permit(:name, :email, :photo, :trees)
    end
end
