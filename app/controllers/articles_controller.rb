class ArticlesController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
    # @articles = Article.all
    render json: @articles ,status: :ok
  end

  def show
    @article =Article.find(params[:id])
    render json: @article ,status: :ok
  end

  def create
    @article =Article.new(article_params)
    if @article.save
      render json: @article ,status: :created
    else
      render json: {errors: @article.errors.full_messages} ,status: :unprocessable_entity
    end
  end

  def update
    @article=Article.find_by(params[:id])
    if @article.update(article_params)
      render json: @article ,status: :ok
    else
      render json: {errors: @article.errors.full_messages} ,status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find_by(params[:id])
    if @article.destroy
      render json: @article ,status: :ok
    else
      render json: {errors: @article.errors.full_messages} ,status: :unprocessable_entity
    end
  end
  

  private 
  def article_params
    params.require(:article).permit(:title,:body, :image)
  end
end
