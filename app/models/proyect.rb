class Proyect < ActiveRecord::Base
  validates :name, presence: true, uniqueness:  true
  belongs_to :zone
  belongs_to :user
  has_many   :spends
  has_many   :viaticos
  has_many   :brokers
  has_many   :users, through: :brokers
  after_create :save_brokers


  private
  def save_brokers
			Broker.create(user_id: self.user.id,proyect_id: self.id)
  end	
end
