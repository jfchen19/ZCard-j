class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.login(params[:user])
      session[:user9527] = params[:user][:email]  # 以email作為號碼牌 Server:session/User:cookie
      redirect_to root_path, notice: '登入成功'
    else
      redirect_to session_path, notice: '登入失敗'
    end
    def destroy
      session[:user9527] = nil
      redirect_to root_path, notice: '已登出'
    end
  end
end