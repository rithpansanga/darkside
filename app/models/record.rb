class Record <ActiveRecord::Base
    belongs_to :hteam, class_name: "Team", foreign_key: "home_id"
    belongs_to :ateam, class_name: "Team", foreign_key: "away_id"
    validates :home_id, :uniqueness => {:scope => [:hscore, :ascore, :away_id]}
 
    
end