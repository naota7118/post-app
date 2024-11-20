class ApplicationController < ActionController::Base
  before_action :log_session_creation

  private

  def log_session_creation
    Rails.logger.debug "Session content: #{session.to_hash.inspect}"
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url, status: :see_other
    end
  end
  
  # これでどのコントローラでも使える
  include SessionsHelper
end
