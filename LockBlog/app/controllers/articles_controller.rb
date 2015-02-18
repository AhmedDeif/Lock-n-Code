class ArticlesController < ApplicationController   
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
       @user = current_user
    #puts session[:user_id]
      if (session[:user_id] && @user.admin == true || @user.authorized == true)
        @article = Article.new(article_params)
        if @article.save!
            puts @article.image
            redirect_to @article
        end
        else
           flash.now[:alert] = 'NOOO !!'
           redirect_to articles_path()
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
