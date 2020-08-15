class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  before_action :set_article, only: [:edit, :update, :destroy, :downvote, :upvote]

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    @article.category = Category.find(params[:article][:category_id])
    @article.star = params[:article][:star] == "1" ? true : false
    if @article.save
      redirect_to articles_path
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
    @article.photo.purge
    @article.destroy
    redirect_to articles_path
  end

  def downvote
    @article.star = false
    @article.save
    redirect_to articles_path
  end

  def upvote
    if Article.where(star: true).count >= 9
      flash[:alert] = "Désolée papou, tu as déjà 9 favoris."
      redirect_to articles_path
    else
      @article.star = true
      @article.save
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:name, :star, :photo)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
