class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
    if @user
      login(@user)
      #@user.reset_session_token!
      #@user.ensure_session_token
      redirect_to cats_url #localhost:3000/cats is the same
    else
      render :new #new
    end
  end

  # def destroy
  #   logout!
  #   redirect_to new_session_url
  # end


  
end