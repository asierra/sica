class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(:main, notice: 'Login successful')
    else
      flash.now[:alert] = 'Intente de nuevo'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:login, notice: 'Salida exitosa del sistema')
  end
end

