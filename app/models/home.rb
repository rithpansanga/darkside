class Home <ActiveRecord::Base

    belongs_to :team
    has_many :matches
    validates :team_id, presence:true
    
    def team_name
    	team.name if team
    end

end