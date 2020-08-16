class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "La catégorie #{@category.name} a bien été créée."
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    flash[:alert] = "La catégorie #{@category.name.downcase} a été supprimée ainsi que toutes les oeuvres associées."
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
