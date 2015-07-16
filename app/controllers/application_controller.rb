class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception




  protected
		def autenticacion_normal!
			redirect_to zones_path unless user_signed_in? && current_user.is_normal_user?
		end
		def autenticacion_admin!
			redirect_to zones_path unless user_signed_in? && current_user.is_admin?
		end

  private
  	def auth
  		unless user_signed_in?
			redirect_to new_user_session_path
		end

	end
	
end
