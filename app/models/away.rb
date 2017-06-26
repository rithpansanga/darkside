class Away <ActiveRecord::Base
    
    belongs_to :team
    has_many :matches
      def team_name
    	team.name if team
    end
    
end