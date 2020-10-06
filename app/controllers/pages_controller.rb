class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact ]

  def home
    @star_articles = Article.where(star: true)
    @selected_categories = @star_articles.map { |article| article.category}.uniq
  end

  def contact
  end
end
