class Viatico < ActiveRecord::Base
  belongs_to :user
  belongs_to :proyect
end
