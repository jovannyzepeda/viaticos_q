module Scope
  extend ActiveSupport::Concern
  included do
    scope :ultimos, ->{order("created_at DESC")}
    scope :ultimos_fecha, ->{order("fecha DESC")}
    scope :zona, lambda{|zone| where("zone_id = ?",zone)}
    scope :broker, lambda{|id| where(user_id: id)}
  	scope :activos, ->{ where("status = 0")}
  	scope :lista_usuarios, lambda{|id|where("id != ? AND tipo_usuario = 1",id)}
  	scope :usuario_inactivo, ->{where("tipo_usuario != 0")}
  	scope :usuario, lambda{|user_id| where("user_id = ?",user_id)}
  	scope :proyecto, lambda{|proyect| where("proyect_id = ? ",proyect)}
  	scope :calendario, lambda{|inicio,fin| where("fecha BETWEEN ? AND ?",inicio,fin)}
  	
  end

end