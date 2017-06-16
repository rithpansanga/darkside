class Team < ActiveRecord::Base
    
  belongs_to :league
  validates :league_id, presence:true
  
  
    
end