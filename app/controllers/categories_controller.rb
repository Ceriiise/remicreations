class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to articles_path
  end
  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
