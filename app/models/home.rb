class Home <ActiveRecord::Base

    belongs_to :team
    has_many :matches

end