class Tutorial < ApplicationRecord

    before_validation :normalize_format 

    validates :name, presence: true
    validates :category, presence: true
    validates :format, presence: true, inclusion:{
        in: %w[mp4 mov avi],
        message: "%{value}must be one of mp4, mov, avi"
    }

    has_many :profile_tutorials, dependent: :destroy
    has_many :profiles, through: :profile_tutorials

    private

    def normalize_format
        self.format = format.downcase.strip if format.present?
    end
end
