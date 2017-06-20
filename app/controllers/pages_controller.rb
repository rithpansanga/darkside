class PagesController <ApplicationController

	def main


	end

	def home
		
		@Teams = Team.all
		@Homes = Home.all
		@Aways = Away.all
		@Matches = Match.all

	end



end