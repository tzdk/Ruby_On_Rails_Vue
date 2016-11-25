class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(name: params[:username])
    if user && user.authenticate(params[:password])
        log_in user
        json_str = user.to_json
        render :json=>json_str, status=>'200'
        #render :json=>'{user:}', status=>'200'
        #redirect_back_or user
    else
      # 创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    render :json=>{}, status=>'200'
  end
end
