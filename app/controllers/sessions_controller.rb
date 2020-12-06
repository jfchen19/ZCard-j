class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    pw = Digest::SHA1.hexdigest("a#{params[:user][:email]}z")

    @user = User.find_by(email: params[:user][:email],
                         password: pw)
    if @user
      redirect_to root_path, notice: '登入成功'
    else
      redirect_to '/sessions', notice: '登入失敗'
    end
  end

end