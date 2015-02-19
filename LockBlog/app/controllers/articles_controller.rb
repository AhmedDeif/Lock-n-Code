class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
        @articles = @articles.select{|v| v.category == params[:category]} if !params[:category].blank?
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
		@article = Article.new
    end
	
    def create
        @user = User.find(session[:user_id])

       if(session[:user_id] &&
        (@user.admin == true || @user.authorized == true))
        @article = Article.new(article_params)


        @article.text += "\n" + "-------------------------------------" + "\n" + @user.signature
        if (@article.save!)

        if !(@user.signature.blank?)
            @article.text += "\n" + "-------------------------------------" + "\n" + @user.signature
        end
        @article.save!
            puts @article.image
            redirect_to @article
        else

           render 'new'
           flash.now[:alert] = 'NOOO !!'
           redirect_to articles_path()
        end
end
end

    def current_user
        @current_user || 
        User.find(session[:user_id]) if session[:user_id]
    end
        

     def edit
  @article = Article.find(params[:id])
end
    

 def update
    @user = User.find(session[:user_id])
 if (@user.admin==true)
  @article = Article.find(params[:id])
 
  if (@article.update(article_params))
    redirect_to @article
  else
    render 'edit'
  end
end
end

def destroy
  @user = User.find(session[:user_id])
 if (@user.admin==true)
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end
end

    def current_user
        @current_user || 
        User.find(session[:user_id]) if session[:user_id]
    end
	
    helper_method :current_user
	
    private
    def article_params
        params.require(:article).permit(:title, :text, :category, :image)
    end
    

    
end
