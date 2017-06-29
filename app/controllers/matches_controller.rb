class MatchesController <ApplicationController
  
  def new
    @match = Match.new
    @homes = Home.all
    @aways = Away.all
  end

  def create
    @match = Match.new(match_params)

    raise params.inspect

    if @match.hscore > @match.ascore
  
      winteam = Scoretable.new(team_id: @match.home_id , point: 3)
      loseteam = Scoretable.new(team_id: @match.away_id, point: 0)

      winteam.save
      loseteam.save
    elsif @match.hscore < @match.ascore
      winteam = Scoretable.new(team_id: @match.home_id , point: 0)
      loseteam = Scoretable.new(team_id: @match.away_id, point: 3)

      winteam.save
      loseteam.save

    elsif @match.hscore = @match.ascore
      winteam = Scoretable.new(team_id: @match.home_id , point: 1)
      loseteam = Scoretable.new(team_id: @match.away_id, point: 1)

      winteam.save
      loseteam.save


    # else 
    #   winteam = Scoretable.new(team_id: @match.home_id , point: 0)
    #   loseteam = Scoretable.new(team_id: @match.away_id, point: 0)

    #   winteam.save
    #   loseteam.save

    end
    
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
    @match = Match.find(params[:id])
  end

  def edit
    @match = Match.find(params[:id])
  end  

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:notice] = "Match was successfully updated"
      redirect_to match_path(@match)
    else
      render 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    flash[:notice] = "Match was successfully deleted"
    redirect_to matches_path
  end

  private 
  def match_params
    params.require(:match).permit(:result, :home_id, :away_id, :hscore, :ascore, :date)
  end
end