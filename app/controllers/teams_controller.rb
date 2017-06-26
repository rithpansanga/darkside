class TeamsController <ApplicationController
	

	

	def new
		@team = Team.new
		@leagues = League.all

	end

	def create
	
		@leagues = League.all
		@team = Team.new(team_params)
		if @team.save
			flash[:notice] = "team was succesfully created"
			redirect_to team_path(@team)
		else 
			render 'new'
		end

	end

	def index

		@teams= Team.all

	end

	def edit
		@team = Team.find(params[:id])

	end  

	def update
		@team = Team.find(params[:id])
		if @team.update(team_params)
			flash[:notice] = "Team name was successfully updated"
			redirect_to team_path(@team)
		else
			render 'edit'

		end

	end


	

	def show
		@team = Team.find(params[:id])

	end

	def destroy
		@team = Team.find(params[:id])
		@team.destroy
		flash[:notice] = "Team was successfully deleted"
		redirect_to teams_path
	end


	


	private 
		def team_params
			params.require(:team).permit(:name,:coach,:league_id)
			
		end

	

end