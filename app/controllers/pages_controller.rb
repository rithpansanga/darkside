class PagesController <ApplicationController

	def main


	end

	def home
		
		@Teams = Team.all
		@Homes = Home.all
		@Aways = Away.all

	end



end