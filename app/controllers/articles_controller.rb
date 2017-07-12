class ArticlesController <ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit,:update,:destroy]

  

  def new
    @article = Article.new
   
 
  end
  def index
    @articles = Article.all
  end

  def create

  @article = Article.new(article_params)

  @article.user = User.last

  if @article.save

  flash[:success] = "Article was successfully created"

  redirect_to article_path(@article)

  else

  render 'new'

  end

  end

  def edit


     

  end

  def update


    if @article.update(article_params)
      flash[:notice] = "Article name was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'

    end

  end


  def show
 
  end

   def destroy
   
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end



 
  private 
    def article_params
      params.require(:article).permit(:title,:description)
      
    end
  def set_article
    @article = Article.find(params[:id])
  end
  def require_same_user
    if !logged_in?       
      flash[:danger] = "You're not admin"
      redirect_to darkside_path
    end

  end
  
  

end