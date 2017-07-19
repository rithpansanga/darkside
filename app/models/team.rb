class Team < ActiveRecord::Base
    
  belongs_to :league
  has_many :scoretables
  has_many :records
  has_many :squads
  mount_uploader :avatar, AvatarUploader


  #belongs_to :match
  #validates :league_id, presence:true
  validates :name,uniqueness: { case_sensitive: false }
 

  def self.showrecord
    url = "http://127.0.0.1:3000/test"
    doc = Nokogiri::HTML(open(url))
        doc.css(".score-time a, .team-a a, .team-b a" ).each_slice(3).to_a.each  do |t| 
          
           home = t[0].text.strip
           score = t[1].text.split()
           hscore = score[0].to_i
           ascore = score[2].to_i
           away = t[2].text.strip
           hometeam = Team.find_or_create_by(name: home)
           awayteam = Team.find_or_create_by(name: away)
           if hscore > ascore
           result = "W"
           elsif hscore < ascore
           result = "L"
           elsif hscore =  ascore
           result = "D"
           end
           if hscore >= 8


           else
            r = Record.create(home_id: hometeam.id, away_id: awayteam.id, hscore: hscore, ascore: ascore, result: result)
        
           end
        end    
  end

  def self.addsquad
    url = "http://uk.soccerway.com/teams/england/chelsea-football-club/661/"
    doc = Nokogiri::HTML(open(url))
    doc.css("#page_team_1_block_team_squad_8-table div:nth-child(1)").each do |t|
    player = t.text.strip

    r = Squad.create(name: player, team_id: 5) 

    end

  def self.add
    url = "http://uk.soccerway.com/teams/russia/fk-lokomotiv-moscow/1843/"
    doc = Nokogiri::HTML(open(url))
    i = 0;
    doc.css("#page_team_1_block_team_squad_7-table a").each do |t|
      r = t[i+1].text
      re = Squad.create(name: r, team_id: 61) 
      i = i+1

    end
    
  end




  end



end
