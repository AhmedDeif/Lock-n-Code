class RepliesController < ApplicationController
	
  def destroy
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])
    if (session[:user_id] &&
     ((current_user.admin == true) || 
        :user == session[:user_id]))
    @reply.destroy
    redirect_to :back
  else 
    redirect_to :back
    end
  end 

	def create
	@comment = Comment.find(params[:comment_id])
     if (session[:user_id])
    	@reply = @comment.replies.create(replies_params)
		
		if !(current_user.signature.blank?)
          @newReply = @reply.body + "\n" + "-------------------------------------" + "\n" + current_user.signature
          @reply.update(body: @newReply)
        end
		
    	redirect_to  :back
  end
end
	
	def show

	end
 

def current_user
         @current_user || 
        User.find(session[:user_id]) if session[:user_id]
		end
    end

  private
    def replies_params
      params.require(:reply).permit(:body,:user_id,:comment_id)
    end
