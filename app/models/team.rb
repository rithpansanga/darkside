class Team < ActiveRecord::Base
    
  belongs_to :league
  has_many :scoretables
  has_many :homes
  has_many :aways
  #belongs_to :match

  validates :league_id, presence:true
  def self.showrecord
    url = "http://uk.soccerway.com/teams/england/manchester-city-football-club/676/matches/"
    agent = Mechanize.new
    page = agent.get(url)

    doc = Nokogiri::HTML(open(url))
    
       

        doc.css(".score-time a, .team-a a, .team-b a" ).each_slice(3).to_a.each  do |t| 
          
           home = t[0].text.strip
           score = t[1].text.split()
           hscore = score[0].to_i
           ascore = score[2].to_i
           away = t[2].text.strip
           r = Record.create(home: home, away: away, hscore: hscore, ascore: ascore)
        end  
  end
end