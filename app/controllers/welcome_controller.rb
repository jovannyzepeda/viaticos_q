class WelcomeController < ApplicationController
	before_action :auth

  def index

  end 


  private 
  def zone
  	redirect_to zones_path
  end
end
