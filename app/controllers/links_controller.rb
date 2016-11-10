class LinksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def show
      @link =  Link.find(params[:id])
  end
  
  def new 
      @link = Link.new
  end
  
  
  def create 
      @link = Link.new(link_params)
      if @link.save
          redirect_to root_path
      end
  end
  
  private
  
  #strong_parameters
  def link_params
      params.require(:link).permit(:url, :title).merge(user_id: current_user.id)
  end
      
  
    
end