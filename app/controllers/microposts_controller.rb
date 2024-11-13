class MicropostsController < ApplicationController

  def index
    
  end

  def create
    user_id = 1
    @micropost = Micropost.new(params[:post])
    binding.pry
    if @micropost.save
      redirect_to @micropost
    else
      render 'new'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  private
    def micropost_params
      params.expect(micropost: [:content])
    end

end