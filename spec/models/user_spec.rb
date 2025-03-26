require 'rails_helper'

RSpec.describe User, :type => :model do
    describe "user model receives correct values" do
        it 'returns the correct name' do
            user = create(:user)  # Use FactoryBot or FactoryGirl for creating test data
            expect(user.name).to eq("John Doe")
        end
        it 'returns the correct email' do
            user = create(:user)  # Use FactoryBot or FactoryGirl for creating test data
            expect(user.email).to eq("john@example.com")
        end
        it 'returns the correct age' do
            user = create(:user)  # Use FactoryBot or FactoryGirl for creating test data
            expect(user.age).to eq(25)
        end
        it 'returns a valid password ' do
            user = create(:user)  # Use FactoryBot or FactoryGirl for creating test data
            expect(user.password).to eq("password123")
        end
    end
end

    
   

       

