class Api::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: { articles: articles }
  end

  def show
    article = Article.find(params[:id])
    render json: { article: article }
  end

  def create
    new_article = Article.new
    new_article.title = params[:article][:title]
    new_article.body = params[:article][:body]
    new_article.save
    render json: { article: new_article }, status: 201
  end
end
