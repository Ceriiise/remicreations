class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    @article.category = Category.find(params[:article][:category])
    @article.star = params[:article][:star] == "1" ? true : false
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @articles = Article.all
    @categories = Category.all
  end

  private

  def article_params
    params.require(:article).permit(:name, :star, :photo)
  end

end
