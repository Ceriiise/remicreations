class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  before_action :set_article, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
    @article.build_category
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
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
    @category = Category.new
  end

  def edit
    @categories = Category.all
  end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:name, :star, :photo, category_attributes: [:id, :name])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
