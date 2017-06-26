class LeaguesController <ApplicationController
	

	def index
		@leagues = League.all

	end

	def new
		@league = League.new

	end

	def create

		#render plain: params[:leagues].inspect

		@league = League.new(league_params)
		if @league.save
			flash[:notice] = "League was succesfully created"
			redirect_to league_path(@league)
		else 
			render 'new'
		end


	end

	def show
		@league = League.find(params[:id])
		
	end

	def edit
		@league = League.find(params[:id])

	end  

	def update
		@league = League.find(params[:id])
		if @league.update(league_params)
			flash[:notice] = "League name was successfully updated"
			redirect_to league_path(@league)
		else
			render 'edit'

		end

	end

	def destroy
		@league = League.find(params[:id])
		@league.destroy
		flash[:notice] = "League was successfully deleted"
		redirect_to leagues_path
	end

	


	private 
		def league_params
			params.require(:league).permit(:name)
			
		end

end