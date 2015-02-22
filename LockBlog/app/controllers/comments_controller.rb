class CommentsController < ApplicationController
	
  def destroy
       if (session[:user_id])
      @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
	if ((current_user.admin == true) || 
        :user == session[:user_id])
    @comment.destroy
    redirect_to article_path(@article)
	else
     @article = Article.find(params[:article_id])
     redirect_to article_path(@article)
	end 
    end
    end
 
	def create
    @article = Article.find(params[:article_id])
    if (session[:user_id])
    @comment = @article.comments.create(comment_params)
	     @comment.update_attribute :user_id , session[:user_id]
        if !(current_user.signature.blank?)
          newComment = @comment.body + "\n" + "-------------------------------------" + "\n" + current_user.signature
          @comment.update(body: newComment)
        end
         
    redirect_to article_path(@article)
	else 
        flash.now[:alert] = 'NOOO !!'
        redirect_to article_path(@article)
    end

	end 
 
 end
	def current_user
         @current_user || 
        User.find(session[:user_id]) if session[:user_id]
    end
	
  private
    def comment_params
      params.require(:comment).permit(:body, :user)
    end
