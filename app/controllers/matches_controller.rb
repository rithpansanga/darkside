class MatchesController <ApplicationController
	

	

	def new
		@match = Match.new
		@homes = Home.all
		@aways = Away.all
		

	end

	def create

		

		@match = Match.new(match_params)
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