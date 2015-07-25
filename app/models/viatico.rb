class Viatico < ActiveRecord::Base
  belongs_to :user
  belongs_to :proyect
  include Scope
end
