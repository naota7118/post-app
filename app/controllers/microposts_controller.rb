class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    current_user
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が作成されました！"
      redirect_to @micropost
    else
      render 'new'
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def destroy
    
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end

end