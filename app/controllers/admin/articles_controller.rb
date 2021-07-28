class Admin::ArticlesController<AdminController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def show; end

  def edit; end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article), notice: 'article has been created successfully'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: 'article has been updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: 'article has been deleted successfully'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
