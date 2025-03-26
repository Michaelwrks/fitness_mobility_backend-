require 'rails_helper'

RSpec.describe Profile, :type => :model do
    describe "profile model receives correct values" do
        it 'returns a valid mobility level' do
            profile = create(:profile)  # Use FactoryBot or FactoryGirl for creating test data
            expect(profile.mobility_level).to eq("beginner")
        end
        it 'returns valid goals' do
            profile = create(:profile)  # Use FactoryBot or FactoryGirl for creating test data
            expect(profile.goals).to eq("Improve Flexibility")
        end
    end
end




