class WelcomeController < ApplicationController
  def articles
  	@articles = Article.all
  end

  def users
@users = User.all
  end
end
