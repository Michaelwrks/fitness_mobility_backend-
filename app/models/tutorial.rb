class Tutorial < ApplicationRecord
    validates :name, presence: true
    validates :category, presence: true
    validates :format, presence: true, inclusion:{
        in: %w[mp4 mov avi],
        message: "%{value}must be one of mp4, mov, avi"
    }
end
