class AdminsController < ApplicationController
  #before_action :autenticacion_admin!, only: [:destroy,:index,:new]
  #before_action :authenticate_user!, except: [:edit,:show]

  def index
    @users = User.where("id != ? AND tipo_usuario = 1",current_user.id)
  end

  def new
    @user = User.new
    
  end

  def create
    @user = User.new(user_params)
    unless @first_user.present?
      @user.tipo_usuario = 2
    end
    if @user.save
      flash[:notice] = "Usuario Creado exitosamente." 
      unless @first_user.present?
        redirect_to zones_path
      end
      unless @first_user.blank?
        redirect_to admins_path
      end
      
    else
      flash[:notice] = "Datos Erroneos o password menor a 8 caracteres"
      render :action => 'new'
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.tipo_usuario = 0
    user.email = user.email + user.id.to_s
    #M21crhXQ#
    user.encrypted_password = '$2a$10$BttO0P5nE9k9n5lsIwZoc.G5x5hg8vIOkm3iM9GJyoFwq9uN51mKC'
    if user.save
      flash[:notice] = "Usuario eliminado correctamente"
      redirect_to admins_path
    end
   
  end 
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end