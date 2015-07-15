class Zone < ActiveRecord::Base
	validates :name, presence: true, uniqueness:  true
	has_many :proyects	
end
