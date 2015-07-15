class Proyect < ActiveRecord::Base
  validates :name, presence: true, uniqueness:  true
  belongs_to :zone
  belongs_to :user
  has_many   :spends
  has_many   :viaticos
  has_many   :brokers
  has_many   :users, through: :brokers
  attr_reader :brokers
  after_create :save_brokers


  def brokers=(value)
		@brokers = value
  end

  private
  def save_brokers
		@brokers.each do |user|
			Broker.create(user_id: user,proyect_id: self.id)
		end
  end	
end
