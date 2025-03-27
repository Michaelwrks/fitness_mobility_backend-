class Profile < ApplicationRecord

    before_validation :normalize_mobility_level   
    
    validates :mobility_level, presence:true,
    
    inclusion:{
        in: %w[beginner intermediate pro],
        message: "%{value} Invalid mobility level"
    }
    validates :goals, presence:true 

    belongs_to :user

    has_many :profile_tutorials, dependent: :destroy
    has_many :tutorials, through: :profile_tutorials


    accepts_nested_attributes_for :tutorials

    private

    def normalize_mobility_level
        self.mobility_level = mobility_level.downcase.strip if mobility_level.present?
    end
end

