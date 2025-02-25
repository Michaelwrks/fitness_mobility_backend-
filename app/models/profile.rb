class Profile < ApplicationRecord
    validates :mobility_level, presence:true,
    
    inclusion:{
        in: %w[beginner medium high],
        message: "%{value} Invalid mobility level"
    }
    validates :goals, presence:true 

    belongs_to :user

    has_many :tutorials, dependent: :destroy

end
