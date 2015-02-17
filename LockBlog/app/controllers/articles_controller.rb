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
        @article = Article.new(article_params)
        if @article.save!
            puts @article.image
            redirect_to @article
        else
            render 'new'
        end
    end
    
    private
<<<<<<< HEAD
        
=======
    def article_params
        params.require(:article).permit(:title, :text, :category, :image)
    end
    
>>>>>>> dajfjfda
    end
