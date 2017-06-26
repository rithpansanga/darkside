class Team < ActiveRecord::Base
    
  belongs_to :league
  has_many :homes
  has_many :aways
  validates :league_id, presence:true
  

    
end