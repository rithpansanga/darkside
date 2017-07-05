class Team < ActiveRecord::Base
    
  belongs_to :league
  has_many :scoretables
  # has_many :homes
  # has_many :aways
  has_many :records
  #belongs_to :match
  validates :league_id, presence:true

  def self.showrecord
    url = "http://uk.soccerway.com/teams/england/afc-bournemouth/711/matches/"
    # agent = Mechanize.new
    # page = agent.get(url)

    doc = Nokogiri::HTML(open(url))
        doc.css(".score-time a, .team-a a, .team-b a" ).each_slice(3).to_a.each  do |t| 
          
           home = t[0].text.strip
           score = t[1].text.split()
           hscore = score[0].to_i
           ascore = score[2].to_i
           away = t[2].text.strip
           h = Team.find_or_create_by(name: home)
           a = Team.find_or_create_by(name: away)
           if hscore > ascore
           result = "W"
           elsif hscore < ascore
           result = "L"
           elsif hscore =  ascore
           result = "D"
           end

           r = Record.create(home_id: h.id, away_id: a.id, hscore: hscore, ascore: ascore, result: result)
        end    
  end
end