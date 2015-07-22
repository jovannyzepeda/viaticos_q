class ListaController < ApplicationController
	before_action :set_proyect
  def index
  		@spends = Spend.paginate(:page => params[:page], :per_page => 20).where("user_id = ? AND proyect_id = ?",current_user.id,@proyect).order('fecha  DESC')
  end
  def set_proyect
      @proyect = Proyect.find(params[:proyect_id])
      @zone = Zone.find(params[:zone_id])
    end
end
