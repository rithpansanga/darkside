class HomesController <ApplicationController
	
def index
		@homes = Home.all

	end
	

	def new
		@home = Home.new
		

	end

	def create
	
		
		@home = Home.new(home_params)
		if @home.save
			flash[:notice] = "home team was succesfully created"
			redirect_to home_path(@home)
		else 
			render 'new'
		end

	end


	def edit
		@home = Home.find(params[:id])

	end 


	def update
		@home = Home.find(params[:id])
		if @home.update(home_params)
			flash[:notice] = "home name was successfully updated"
			redirect_to home_path(@home)
		else
			render 'edit'

		end

	end 

	

	def show

		@home = Home.find(params[:id])

	end


	def destroy
		@home = Home.find(params[:id])
		@home.destroy
		flash[:notice] = "home was successfully deleted"
		redirect_to homes_path
	end



		
	private 
		def home_params
			params.require(:home).permit(:stadium,:team_id)
			
		end
	

end