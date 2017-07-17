class Squad <ActiveRecord::Base
 belongs_to :team, class_name: "Team", foreign_key: "team_id"
 validates :name,uniqueness: { case_sensitive: false }
 mount_uploader :avatar, AvatarUploader

    

    
end