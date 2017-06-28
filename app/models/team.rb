class Team < ActiveRecord::Base
    
  belongs_to :league
  has_many :homes
  has_many :aways

  validates :league_id, presence:true


   def self.calscore
      	score = 0;
      	@teams = Team.all
      	team_array = {}


      	@teams.each do |team|
      		score = 0;
      		team.homes.each do |home|
      			if home.matches.result == "W"

      				score = score + 3
      			elsif home.matches.result == "D"

      				score = score + 1
      			else

      				score = score + 0

      			end

      				

      		end

      		team.aways.each do |away|
      			if away.matches.result == "L"

      				score = score + 3
      			elsif away.matches.result == "D"

      				score = score + 1
      			else

      				score = score + 0

      			end

      		end

      		team_array << {"team.name" => score}

      	end




      end
  

    
end