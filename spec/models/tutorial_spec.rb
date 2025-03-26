require 'rails_helper'

RSpec.describe Tutorial, :type => :model do
    describe "tutorial model receives correct values" do
        it 'returns a valid name' do
            tutorial = create(:tutorial)  # Use FactoryBot or FactoryGirl for creating test data
            expect(tutorial.name).to eq("Fixing rounded shoulders")
        end
        it 'returns a valid category' do
            tutorial = create(:tutorial)  # Use FactoryBot or FactoryGirl for creating test data
            expect(tutorial.category).to eq("Kyphosis")
        end
        it 'returns a valid format' do
            tutorial = create(:tutorial)  # Use FactoryBot or FactoryGirl for creating test data
            expect(tutorial.format).to eq("mp4")
        end
    end
end

    
   

       

