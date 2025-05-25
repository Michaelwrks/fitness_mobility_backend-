class User < ApplicationRecord
  acts_as_token_authenticatable
  
  before_save :check_auth_token
  
  def check_auth_token
    puts "Before Save: #{authentication_token}"
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :age, presence: true
    validates :password, presence: true, length: { minimum: 6 }  

    has_one :profile, dependent: :destroy
end





