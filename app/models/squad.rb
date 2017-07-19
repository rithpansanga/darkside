class Squad <ActiveRecord::Base
 belongs_to :team, class_name: "Team", foreign_key: "team_id"
 validates :name,uniqueness: { case_sensitive: false }
 mount_uploader :avatar, AvatarUploader


 def self.addstatst
  url = "https://www.premierleague.com/players/3452/Danny-Welbeck/stats"
  doc = Nokogiri::HTML(open(url))
  t = doc.css(".normalStat .allStatContainer").text
  tt = t.encode(universal_newline: true)
  ttt = tt.split()
  goal = ttt[0]
  gp = ttt[1]
  gpm = gp.to_f

  assist = ttt[12]
  tackle = ttt[21]
  blockshot = ttt[22]
  interception = ttt[23]
  clearance = ttt[24]

  s = Squad.where(id: 75 )
  r = s.update(goal: goal, gpm: gpm, assist: assist, tackle: tackle, 
    blockshot: blockshot, interception: interception, clearance: clearance)
  

end

    

    
end