class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: true, uniqueness:  true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :proyects, :dependent => :destroy
  has_many :spends
  has_many :viaticos
  has_many   :brokers
  
  include PermissionsConcern
end
