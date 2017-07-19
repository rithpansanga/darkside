class SquadsController <ApplicationController
  

  def index
    @squads = Squad.all

  end

  def new
    @squad = Squad.new

  end

  def create
    @squad = Squad.new(squad_params)
    if @squad.save
      flash[:notice] = "Squad was succesfully created"
      redirect_to squad_path(@squad)
    else 
      render 'new'
    end


  end

  def show
    @squad = Squad.find(params[:id])
    Squad.addstatst
    
  end

  def edit
    @squad = Squad.find(params[:id])

  end  

  def update
    @squad = Squad.find(params[:id])
    if @squad.update(squad_params)
      flash[:notice] = "Squad name was successfully updated"
      redirect_to squad_path(@squad)
    else
      render 'edit'

    end

  end

  def destroy
    @squad = Squad.find(params[:id])
    @squad.destroy
    flash[:notice] = "squad was successfully deleted"
    redirect_to squads_path
  end

  


  private 
    def squad_params
      params.require(:squad).permit(:name,:position,:team_id,:xl,:avatar,:foot,:birth,:nationality,:goal,:gpm,:assist,:tackle,
        :blockshot,:interception, :clearance)
      
    end

end

