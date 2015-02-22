class SessionsController < ApplicationController
  def new
  end
  

  def Destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "logged out"  
   end  
   
  def create
      user = User.authenticate(params[:email],params[:password])
      if user
          session[:user_id] = user.id
          redirect_to articles_path
       else
        flash.now.alert = "Invalid email or password"
        render 'new'
        end
      end
 
end
