class SessionsController < ApplicationController
  def new
  end
  
  def create
      user = User.authenticate(params[:email],params[:password])
      if user
          session[:user_id] = user.id
          redirect_to articles_path, :notice => "logged in !"
       else
        flash.now.alert = "Invalid email or password"
        render 'new'
        end
      end
end
