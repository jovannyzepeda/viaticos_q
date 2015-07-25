class ListaController < ApplicationController
	before_action :set_proyect
  def index
  		@spends = Spend.paginate(:page => params[:page], :per_page => 20).usuario(current_user.id).proyecto(@proyect).ultimos_fecha
  end
  def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
      @zone = Zone.find(params[:zone_id])
    end
end
