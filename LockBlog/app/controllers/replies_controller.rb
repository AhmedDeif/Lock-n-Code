class RepliesController < ApplicationController
	def destroy
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])
    if (session[:user_id] && ((current_user.admin == true) || 
        :user == session[:user_id]))
    @reply.destroy
    redirect_to :back
  else 
    redirect_to :back
    end
  end 

	def create
     if (session[:user_id])
    	@comment = Comment.find(params[:comment_id])
    	@reply = @comment.replies.create(comment_params)
       @comment.update_attribute :user_id , session[:user_id]
    	redirect_to  :back
  	end
  end
	
	def show
	end
 

def current_user
         @current_user || 
        User.find(session[:user_id]) if session[:user_id]
    end

  private
    def comment_params
      params.require(:reply).permit(:commenter, :body)
    end
end
