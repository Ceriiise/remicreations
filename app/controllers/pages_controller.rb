class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    @categories = Category.all
    @star_articles = Article.where(star: true)
  end

  def contact
  end
end
