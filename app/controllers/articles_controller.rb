class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(strong_params)
    redirect_to articles_path
  end

  def edit; end

  def update
    @article.update(strong_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash[:alert] = 'Article was successfully destroyed.'
    redirect_to articles_path
  end

  private

  def strong_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
