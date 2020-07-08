class ArticlesController < ApplicationController
  before_action :set_category, only: [ :new, :create ]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:name)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
