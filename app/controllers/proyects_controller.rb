class ProyectsController < ApplicationController
  before_action :auth
  before_action :set_proyect, only: [:show, :edit, :update, :destroy]
  before_action :set_zone
  before_action :autenticacion_admin!, only: [:destroy]
  # GET /proyects
  # GET /proyects.json
  def index
  
    zone = Zone.find(params[:zone_id])
    #2nd you get all the comments of this post
    @proyects = zone.proyects
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @proyects }
    end
  end

  # GET /proyects/1
  # GET /proyects/1.json
  def show

    zone = Zone.find(params[:zone_id])
    @spend = Spend.new
    @viatico = Viatico.new
    @broker = Broker.new
    #2nd you retrieve the comment thanks to params[:id]
    @proyects = zone.proyects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @proyects }
    end
  end

  # GET /proyects/new
  def new
    @proyect = Proyect.new
    @proyect.zone = @zone

  end

  # GET /proyects/1/edit
  def edit
    zone = Zone.find(params[:zone_id])
    #2nd you retrieve the comment thanks to params[:id]
    @proyects = zone.proyects.find(params[:id])
  end

  # POST /proyects
  # POST /proyects.json
  def create

    @proyect = current_user.proyects.new(proyect_params)
   
    @proyect.zone = @zone
    respond_to do |format|
      if @proyect.save
        format.html { redirect_to [@zone,@proyect], notice: 'Proyect was successfully created.' }
        format.json { render :show, status: :created, location: @proyect }
      else
        format.html { render :new }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyects/1
  # PATCH/PUT /proyects/1.json
  def update
    respond_to do |format|
      if @proyect.update(proyect_params)
        format.html { redirect_to [@zone,@proyect], notice: 'El proyecto fue actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @proyect }
      else
        format.html { render :edit }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyects/1
  # DELETE /proyects/1.json
  def destroy
    @proyect.destroy
    respond_to do |format|
      format.html { redirect_to zone_path(@zone), notice: 'El proyecto fue eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyect
      @proyect = Proyect.find(params[:id])
    end
    def set_zone
      @zone = Zone.find(params[:zone_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def proyect_params
      params.require(:proyect).permit(:zone_id, :user_id,:name, :brokers)
    end
end
