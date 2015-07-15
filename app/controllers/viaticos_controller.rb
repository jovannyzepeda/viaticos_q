class ViaticosController < ApplicationController
  before_action :auth
  before_action :set_viatico, only: [:show, :edit, :update, :destroy]
  before_action :set_proyect
  before_action :autenticacion_admin!, only: [:destroy]
  # GET /viaticos
  # GET /viaticos.json
  def index
    @viaticos = Viatico.all
  end

  # GET /viaticos/1
  # GET /viaticos/1.json
  def show
  end

  # GET /viaticos/new
  def new
    @zone = Zone.find(params[:zone_id])
    @proyect = @zone.proyects.find(params[:proyect_id])
    @viatico = Viatico.new
  end

  # GET /viaticos/1/edit
  def edit
    @zone = Zone.find(params[:zone_id])
    #2nd you retrieve the comment thanks to params[:id]
    @proyects = @zone.proyects.find(params[:proyect_id])
  end

  # POST /viaticos
  # POST /viaticos.json
  def create
    @viatico = current_user.viaticos.new(viatico_params)
    @viatico.proyect = @proyect
    respond_to do |format|
      if @viatico.save
        format.html { redirect_to [@zone,@proyect], notice: 'El Viatico Fue creado correctamente.' }
        format.json { render :show, status: :created, location: @viatico }
      else
        format.html { render :new }
        format.json { render json: @viatico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viaticos/1
  # PATCH/PUT /viaticos/1.json
  def update
    respond_to do |format|
      if @viatico.update(viatico_params)
        format.html { redirect_to [@zone,@proyect], notice: 'El Viatico fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @viatico }
      else
        format.html { render :edit }
        format.json { render json: @viatico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viaticos/1
  # DELETE /viaticos/1.json
  def destroy
    @viatico.destroy
    respond_to do |format|
      format.html { redirect_to [@zone,@proyect], notice: 'Viatico Eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viatico
      @viatico = Viatico.find(params[:id])
    end
    def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
      @zone = Zone.find(params[:zone_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def viatico_params
      params.require(:viatico).permit(:user_id, :proyect_id, :cantidad, :fecha)
    end
end
