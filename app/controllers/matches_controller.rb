class MatchesController <ApplicationController
  before_action :set_match, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit,:update,:destroy]

  
  def new
    @match = Match.new
    @homes = Home.all
    @aways = Away.all
  end

  def create
    @match = Match.new(match_params)

    Match.calscore @match



    if @match.save
      flash[:notice] = "match was succesfully created"
      redirect_to match_path(@match)
    else 
      render 'new'
    end
  end

  def index
    @matches= Match.all
  end

  def show
    @record = Record.all

  end

  def edit
    @squad = Squad.all
  
  end  

  def update
  #raise inspect.params
    if @match.update(match_params)
      Match.calscore @match
      flash[:notice] = "Match was successfully updated"
      redirect_to match_path(@match)
      
    else
      render 'edit'
    end
  end

  def destroy

 
    Match.deletescore @match
    @match.destroy

  
    flash[:notice] = "Match was successfully deleted"
    redirect_to matches_path
  end


  private 
  def match_params
    params.require(:match).permit(:result, :home_id, :away_id, :hscore, :ascore, :date, :ratio)
  end
  def set_match
    @match = Match.find(params[:id])
  end
  def require_same_user
    if !current_user.admin?
      flash[:danger] = "You're not admin"
      redirect_to darkside_path
    end

  end


end