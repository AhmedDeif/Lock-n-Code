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
        @user = User.find(session[:user_id])
        if(@user.admin == true or @user.authorized == true)
        @article = Article.new(article_params)
        if @article.save!
            puts @article.image
            redirect_to @article
        else
            render 'new'
        end
    else
        redirect_to Article.new
    end

    end


    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    private
    def article_params
        params.require(:article).permit(:title, :text, :category, :image)
    end
    end
