class PagesController <ApplicationController

	def main


	end

	def home
		
		@Teams = Team.all

	end



end