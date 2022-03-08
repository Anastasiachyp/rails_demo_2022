class Api::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    articles = Article.all
    render json: { articles: articles }
  end

  def show
    article = Article.find(params[:id])
    render json: { article: article }
  end

  def create
    article = Article.create(article_params)
    article.attach_image(params[:article][:image])
    render json: { article: article }, status: 201
  end

  private

  def article_params
    params[:article].permit(:title, :body)
  end
end
