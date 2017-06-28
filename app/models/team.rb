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

          home_matches = Match.where(home_id: team.id)
          home_matches.each do |m|

      			if m.result == "W"

      				score = score + 3
      			elsif m.result == "D"

      				score = score + 1
      			else

      				score = score + 0

      			end

      				

      		end
         away_matches = Match.where(away_id: team.id)
          away_matches.each do |a|
      			if a.result == "L"

      				score = score + 3
      			elsif a.result == "D"

      				score = score + 1
      			else

      				score = score + 0

      			end

      		end

      		team_array << {"team.name" => score}

      	end




      end
  

    
end