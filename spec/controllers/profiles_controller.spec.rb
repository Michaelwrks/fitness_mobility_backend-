require 'rails_helper'

RSpec.describe "Profiles", type: :request do

  let!(:user) { User.create!(name: "test name", email: "test@outlook.com", age: 25, password: "test123456") }

  before do
      Profile.create(mobility_level: "beginner", goals: 'test goal', user: user)
      Profile.create(mobility_level: "intermediate", goals: 'test goal 2', user: user)
  end
  
  describe "Performs all CRUD methods for Profiles" do
    it "Gets all profiles and checks the array length" do
      get "/api/v1/profiles"
      expect(response).to have_http_status(:success)
      profiles = JSON.parse(response.body)
      expect(profiles.length).to eq(2)
    end
    
    it "returns the profiles's ID in the response" do
      profile = Profile.create(mobility_level: "pro", goals: 'test goal 3', user: user)
      get "/api/v1/profiles/#{profile.id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['id']).to eq(profile.id)
    end

    it "successfully creates a profile" do
      post "/api/v1/profiles", params:
        {profile: { 
          mobility_level: 'beginner', 
          goals: "full planche", 
          user_id: user.id
        }
      }

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)["mobility_level"]).to eq("beginner")
      expect(JSON.parse(response.body)["user_id"]).to eq(user.id)
    end
    it "creates a tutorial with invalid parameters" do
        post "/api/v1/profiles", params:
        {profile: { 
          mobility_level: "", 
          goals: "", 
          user_id: user.id
        }
      }
      expect(response.status).to eq(422)
    end
    it "successfully updates a user" do
        profile1 = Profile.create(mobility_level: "beginner", goals: 'test goal 4', user: user)

      put "/api/v1/profiles/#{profile1.id}", params:
      {profile: { 
          mobility_level: "pro", 
          goals: "updated goals", 
          user_id: user.id
        }
      }


      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["mobility_level"]).to eq("pro")
      expect(JSON.parse(response.body)["goals"]).to eq("updated goals")
    end
    it "successfully deletes a user" do
        profile2 = Profile.create(mobility_level: "intermediate", goals: 'deleted goal', user: user)
        delete "/api/v1/profiles/#{profile2.id}"
        expect(response.status).to eq(204)    
    end
  end
end


 
      




      


