require 'rails_helper'

RSpec.describe "Tutorials", type: :request do

  let!(:user) { User.create!(name: "test name", email: "test@outlook.com", age: 25, password: "test123456") }
  let!(:profile) { Profile.create!(mobility_level: "beginner", goals: 'test goal', user: user) }

  before do
      Tutorial.create(name: "Improve shoulder mobility", category:"Kyphosis", format: "mp4", profile: profile)
      Tutorial.create(name: "Improve anlke mobility", category:"dorsiflexion", format: "mp4", profile: profile)
  end
  
  describe "Performs all CRUD methods for Tutorials" do
    it "Gets all tutorials and checks the array length" do
      get "/api/v1/tutorials"
      expect(response).to have_http_status(:success)
      tutorials = JSON.parse(response.body)
      expect(tutorials.length).to eq(2)
    end
    
    it "returns the user's ID in the response" do
      tutorial = Tutorial.create!(name: "Improve anlke mobility", category:"dorsiflexion", format: "mp4", profile: profile)
      get "/api/v1/tutorials/#{tutorial.id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['id']).to eq(tutorial.id)
    end

    it "successfully creates a tutorial" do
      post "/api/v1/tutorials", params:
        {tutorial: { 
          name: "Improve hip mobility", 
          category: "Lumbar lordosis", 
          format: "mp4",
          profile_id: profile.id
        }
      }

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)["name"]).to eq("Improve hip mobility")
      expect(JSON.parse(response.body)["profile_id"]).to eq(profile.id)
    end
    it "creates a tutorial with invalid parameters" do
      post "/api/v1/tutorials", params:
      {tutorial: { 
        name: "", 
        category: "", 
        format: "",
        profile_id: profile.id
      }
    }


      expect(response.status).to eq(422)
    end
    it "successfully updates a user" do
      tutorial1 = Tutorial.create!(name: "new test tutorial", category:"new test category", format: "mov", profile: profile)

      put "/api/v1/tutorials/#{tutorial1.id}", params:
      {tutorial: { 
        name: "updated name", 
        category: "updated category", 
        format: "avi",
        profile_id: profile.id
      }
    }


      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["name"]).to eq("updated name")
      expect(JSON.parse(response.body)["format"]).to eq("avi")
    end
    it "successfully deletes a user" do
      tutorial2 = Tutorial.create!(name: "deleted tutorial", category:"deleted category", format: "mp4", profile: profile)

      delete "/api/v1/tutorials/#{tutorial2.id}"

      expect(response.status).to eq(204)
    end
  end
end


 
      




      


