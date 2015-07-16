class BrokersController < ApplicationController
  before_action :set_broker, only: [:show, :edit, :update, :destroy]
  before_action :auth
  before_action :set_proyect
  before_action :authenticate_user!, except: [:update, :edit]

  # GET /brokers.json
  def index
    @brokers = Broker.all
  end

  # GET /brokers/1
  # GET /brokers/1.json
  def show
  end

  # GET /brokers/new
  def new
    @zone = Zone.find(params[:zone_id])
    @proyect = @zone.proyects.find(params[:proyect_id])
    @broker = Broker.new
    @notuser = Array.new(User.joins(:brokers).where("proyect_id = ?", @proyect))
    @user = Array.new(User.all)
   
    @notuser.each do |s|
      @user.delete_if {|x| x.id == s.id }

    end
  end

  # GET /brokers/1/edit


  # POST /brokers
  # POST /brokers.json
  def create
    @broker = Broker.new(broker_params)
    @broker.proyect = @proyect
    respond_to do |format|
      if @broker.save
        format.html { redirect_to [@zone,@proyect], notice: 'Broker agregado al proyecto.' }
        format.json { render :show, status: :created, location: @broker }
      else
        format.html { render :new }
        format.json { render json: @broker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brokers/1
  # PATCH/PUT /brokers/1.json


  # DELETE /brokers/1
  # DELETE /brokers/1.json
  def destroy
    @broker.destroy
    respond_to do |format|
      format.html { redirect_to [@zone,@proyect], notice: 'Broker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_broker
      @broker = Broker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def broker_params
      params.require(:broker).permit(:user_id, :proyect_id)
    end
    def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
      @zone = Zone.find(params[:zone_id])
    end
end
