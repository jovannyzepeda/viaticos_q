class SpendsController < ApplicationController
  before_action :auth
  before_action :set_spend, only: [:show, :edit, :update, :destroy]
  before_action :set_proyect
  before_action :autenticacion_admin!, only: [:destroy]
  # GET /spends
  # GET /spends.json
  def index
    
    @val = params[:xls]
    unless @val.blank?
      @spends = Spend.where("user_id = ? AND status = 0 AND fecha BETWEEN ? AND ?",current_user.id,@val[:inicio],@val[:fin])
      @viaticos = Viatico.where("user_id = ? AND status = 0 AND fecha BETWEEN ? AND ?",current_user.id,@val[:inicio],@val[:fin])
      unless @viaticos.blank?
        @total = 0
        @viaticos.each do |total|
            @total = @total + total.cantidad
        end
        respond_to do |format|
          format.html
          format.xlsx #{send_data @spends.to_csv(col_sep:'\t')}
        end
      end
      unless @spends.present?
          flash[:notice] = "No existen datos en la busqueda solicitada" 
      end
    end
  end 

  # GET /spends/1
  # GET /spends/1.json
  def show
  
  end

  def status
    spend = Spend.find_by(id: params[:status])
    spend.status = 1
    if spend.save
      respond_to do |format|
        format.html { redirect_to [@zone,@proyect], notice: "Gasto Reportado correctamente" }
      end
    end
    
  end


  # GET /spends/new
  def new
    @zone = Zone.find(params[:zone_id])
    @proyect = @zone.proyects.find(params[:proyect_id])
    @spend = Spend.new
  end

  # GET /spends/1/edit
  def edit
    @zone = Zone.find(params[:zone_id])
    #2nd you retrieve the comment thanks to params[:id]
    @proyects = @zone.proyects.find(params[:proyect_id])

  end

  # POST /spends
  # POST /spends.json
  def create
    @spend = current_user.spends.new(spend_params)
    @spend.proyect = @proyect
    respond_to do |format|
      if @spend.save
        format.html { redirect_to [@zone,@proyect], notice: 'Gasto incorporado correctamente' }
        format.json { render :show, status: :created, location: @spend }
      else
        format.html { render :new }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spends/1
  # PATCH/PUT /spends/1.json
  def update
    respond_to do |format|
      if @spend.update(spend_params)
        format.html { redirect_to [@zone,@proyect], notice: 'Gasto Actualizado' }
        format.json { render :show, status: :ok, location: @spend }
      else
        format.html { render :edit }
        format.json { render json: @spend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spends/1
  # DELETE /spends/1.json
  def destroy
    @spend.destroy
    respond_to do |format|
      format.html { redirect_to [@zone,@proyect], notice: 'Dato eliminado exitosamente' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spend
      @spend = Spend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spend_params
      params.require(:spend).permit(:proyect_id, :fecha, :tipo, :importe, :comntarios, :comprobante, :numero_comprobante, :user_id, :ticket,:status)
    end
    def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
      @zone = Zone.find(params[:zone_id])
    end
    
end