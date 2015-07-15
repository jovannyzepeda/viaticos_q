module PermissionsConcern
	#es para agergar tiposdeusuarios yu permisos
	extend ActiveSupport::Concern
	def is_normal_user?
		self.tipo_usuario >= 1
	end
	def is_admin?
		self.tipo_usuario >= 2
	end
end