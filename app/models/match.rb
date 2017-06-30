class Match < ActiveRecord::Base
    
       belongs_to :home, class_name: "Team", foreign_key: "home_id"
       belongs_to :away, class_name: "Team", foreign_key: "away_id"
      #belongs_to :home
      #belongs_to :away

      #has_many :teams
def self.calscore(match)
    if match.hscore.nil? and match.ascore.nil?
    winteam = Scoretable.new(team_id: match.home_id , point: 0 )
    loseteam = Scoretable.new(team_id: match.away_id, point: 0 )
    winteam.save
    loseteam.save

    elsif match.hscore > match.ascore
    winteam = Scoretable.new(team_id: match.home_id , point: 3 , won:1 , gf: match.hscore , ga: match.ascore ,gd: match.hscore - match.ascore)
    loseteam = Scoretable.new(team_id: match.away_id, point: 0 , lost:1 , gf: match.ascore , ga: match.hscore ,gd: match.ascore - match.hscore)
    winteam.save
    loseteam.save

    elsif match.hscore < match.ascore
    winteam = Scoretable.new(team_id: match.home_id , point: 0, lost:1 , gf: match.hscore , ga: match.ascore,gd: match.hscore - match.ascore )
    loseteam = Scoretable.new(team_id: match.away_id, point: 3, won:1 , gf: match.hscore , ga: match.ascore,gd: match.ascore - match.hscore)
    winteam.save
    loseteam.save

    elsif match.hscore = match.ascore
    winteam = Scoretable.new(team_id: match.home_id , point: 1 ,drawn:1 , gf: match.hscore , ga: match.ascore,gd: match.hscore - match.ascore)
    loseteam = Scoretable.new(team_id: match.away_id, point: 1 ,drawn:1 , gf: match.hscore , ga: match.ascore ,gd: match.ascore - match.hscore)
    winteam.save
    loseteam.save
    end
end


def self.deletescore(match)
  if match.hscore.nil? and match.ascore.nil?
    winteam = Scoretable.new(team_id: match.home_id , point: 0 )
    loseteam = Scoretable.new(team_id: match.away_id, point: 0 )
    winteam.save
    loseteam.save

    elsif match.hscore > match.ascore
    winteam = Scoretable.new(team_id: match.home_id , point: -3 , won:-1 , gf: -match.hscore , ga: -match.ascore ,gd: -(match.hscore - match.ascore))
    loseteam = Scoretable.new(team_id: match.away_id, point: 0 , lost:-1 , gf: -match.ascore , ga: -match.hscore ,gd: -(match.ascore - match.hscore))
    winteam.save
    loseteam.save

    elsif match.hscore < match.ascore
    winteam = Scoretable.new(team_id: match.home_id , point: 0, lost:-1 , gf: -match.hscore , ga: -match.ascore,gd: -(match.hscore - match.ascore) )
    loseteam = Scoretable.new(team_id: match.away_id, point: -3, won:-1 , gf: -match.hscore , ga: -match.ascore,gd: -(match.ascore - match.hscore))
    winteam.save
    loseteam.save

    elsif match.hscore = match.ascore
    winteam = Scoretable.new(team_id: match.home_id , point: -1 ,drawn:-1 , gf: -match.hscore , ga: -match.ascore,gd: -(match.hscore - match.ascore))
    loseteam = Scoretable.new(team_id: match.away_id, point: -1 ,drawn:-1 , gf: -match.hscore , ga: -match.ascore ,gd: -(match.ascore - match.hscore))
    winteam.save
    loseteam.save
    end


end



end 