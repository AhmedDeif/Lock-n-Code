class RepliesController < ApplicationController
	def destroy
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.find(params[:id])
    @reply.destroy
    redirect_to :back
  end

	def create
    	@comment = Comment.find(params[:comment_id])
    	@reply = @comment.replies.create(comment_params)
    	redirect_to  :back
  end
	
	def show
      destroy
	end
 
  private
    def comment_params
      params.require(:reply).permit(:commenter, :body)
    end
end
