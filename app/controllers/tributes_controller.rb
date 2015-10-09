class TributesController < ApplicationController
  before_action :set_receiver
  before_action :set_tribute, only: [:show, :edit, :update, :destroy, :more_info, :update_more_info, :plant_trees, :charge_trees]

  def more_info
    render layout: 'application_creation'
  end

  def update_more_info
    @receiver.update(receiver_params)
    redirect_to plant_trees_receiver_tribute_path(@receiver, @tribute)
  end

  def plant_trees
    render layout: 'application_creation'
  end

  def charge_trees
    if number_of_trees = params[:number_of_trees].to_i
      raise StandardError if params[:stripeToken].blank?
      @tribute.charge_trees(params[:stripeToken], number_of_trees)
      redirect_to @receiver, notice: "Thank you, we've received your kind donation. We'll get to work on planting those trees!"
    else
      redirect_to :back
    end
  end

  # GET /tributes
  # GET /tributes.json
  def index
    @active_link = 'tributes'
    @tributes = @receiver.tributes
  end

  # GET /tributes/1
  # GET /tributes/1.json
  def show
  end

  # GET /tributes/new
  def new
    @tribute = @receiver.tributes.new
    render layout: 'application_creation'
  end

  # GET /tributes/1/edit
  def edit
  end

  # POST /tributes
  # POST /tributes.json
  def create
    @tribute = @receiver.tributes.new(tribute_params)
    if @tribute.save
      redirect_to @receiver.complete? ? plant_trees_receiver_tribute_path(@receiver, @tribute) : more_info_receiver_tribute_path(@receiver, @tribute)
    else
      render :new
    end
  end

  # PATCH/PUT /tributes/1
  # PATCH/PUT /tributes/1.json
  def update
    respond_to do |format|
      if @tribute.update(tribute_params)
        format.html { redirect_to [@receiver, @tribute], notice: 'Tribute was successfully updated.' }
        format.json { render :show, status: :ok, location: [@receiver, @tribute] }
      else
        format.html { render :edit }
        format.json { render json: @tribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tributes/1
  # DELETE /tributes/1.json
  def destroy
    @tribute.destroy
    respond_to do |format|
      format.html { redirect_to receiver_url(@receiver), notice: 'Tribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = Receiver.find(params[:receiver_id])
    end

    def set_tribute
      @tribute = @receiver.tributes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tribute_params
      params.require(:tribute).permit(:description, :created_by, :email, :anonymous)
    end

    def receiver_params
      params.require(:receiver).permit(:email, :photo)
    end
end
