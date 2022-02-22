class Api::ArticlesController < ApplicationController
  def index
    # binding.pry
    articles = Article.all
    render json: { articles: articles }
  end
end
