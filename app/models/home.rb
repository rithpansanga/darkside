class Home <ActiveRecord::Base

    belongs_to :team
    has_many :matches
    validates :team_id, presence:true

end