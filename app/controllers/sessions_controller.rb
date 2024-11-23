class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in(user)
      current_user
      # ユーザー詳細ページに遷移
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      # エラーメッセージを表示
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
