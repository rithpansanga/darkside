class Squad <ActiveRecord::Base
 belongs_to :team
 validates :name,uniqueness: { case_sensitive: false }
    

    
end