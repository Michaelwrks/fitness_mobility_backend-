class Account < ApplicationRecord
    validates :mobility_level, presence:true,
    
    inclusion:{
        in: %w[beginner, medium, high],
        message: "%{value}Invalid mobility level"
    }
    validates :goals, presence:true 

end
