class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new]

  def index
    
  end

  def new
    
  end


  private
  
  def move_to_index
    unless user_sign_in?
      redirect_to action: :index
    end
  end

end