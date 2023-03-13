class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article, notice: "Article was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body, :image, :user_id, :status, )
  end

  def authenticate_user
    # Skip authentication for the index action
    return if action_name == 'index'
    super
  end
end

