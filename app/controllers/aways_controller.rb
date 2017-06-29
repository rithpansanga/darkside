class AwaysController <ApplicationController
  
def index
    @aways = Away.all

  end
  

  def new
    @away = Away.new
    

  end

  def create
  
    
    @away = Away.new(away_params)
    if @away.save
      flash[:notice] = "away team was succesfully created"
      redirect_to away_path(@away)
    else 
      render 'new'
    end

  end


  def edit
    @away = Away.find(params[:id])

  end 


  def update
    @away = Away.find(params[:id])
    if @away.update(away_params)
      flash[:notice] = "away name was successfully updated"
      redirect_to away_path(@away)
    else
      render 'edit'

    end

  end 

  

  def show

    @away = Away.find(params[:id])

  end


  def destroy
    @away = Away.find(params[:id])
    @away.destroy
    flash[:notice] = "away was successfully deleted"
    redirect_to aways_path
  end



    
  private 
    def away_params
      params.require(:away).permit(:stadium,:ascore,:team_id)
      
    end
  

end