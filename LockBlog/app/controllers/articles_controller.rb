class ArticlesController < ApplicationController
    
        def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def new
        
    end
    
    def create
        @article = Article.new(article_params)
        
        if @article.save
            redirect_to @article
            else
            render 'new'
        end
        
    end


    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    private
    def article_params
        params.require(:article).permit(:title, :text, :category)
    end

    
end
