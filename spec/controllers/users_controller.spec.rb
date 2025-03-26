require 'rails_helper'

RSpec.describe "Users", type: :request do

  before do
      User.create(name: "Mike", email: "mike-t23@outlook.com", age: 25, password: "helloppass232")
      User.create(name: "Joe bloggs", email: "joe-t23@outlook.com", age: 30, password: "goppass232")
  end
  
  describe "Performs all CRUD methods for users" do
    it "Gets all users and checks the array length" do
      get "/api/v1/users"
      expect(response).to have_http_status(:success)
      users = JSON.parse(response.body)
      expect(users.length).to eq(2)
    end
    
    it "returns the user's ID in the response" do
      user = User.create!(name: "Jack", email: "Jack-t23@outlook.com", age: 35, password: "byeppass232")
      get "/api/v1/users/#{user.id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['id']).to eq(user.id)
    end

    it "successfully creates a user" do
      post "/api/v1/users", params:
        {user: { 
          name: "Nick", 
          email: "nick-t23@outlook.com", 
          age: 15, 
          password: "hello1232"
        }}

      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)["name"]).to eq("Nick")
      expect(JSON.parse(response.body)["email"]).to eq("nick-t23@outlook.com")
    end
    it "creates a user with invalid parameters" do
      post "/api/v1/users", params:
        {user: { 
          name: "", 
          email: "n", 
          age: -1, 
          password: ""
        }}

      expect(response.status).to eq(422)
    end
    it "successfully updates a user" do
      user1 = User.create!(name: "Joe", email: "ricky-t23@outlook.com", age: 50, password: "yoloppass232")

      put "/api/v1/users/#{user1.id}", params:
        {user: { 
          name: "Joseph", 
          email: "josephtest3@outlook.com", 
          age: 85, 
          password: "test1232"
        }}


      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["name"]).to eq("Joseph")
      expect(JSON.parse(response.body)["email"]).to eq("josephtest3@outlook.com")
    end
    it "successfully deletes a user" do
      user1 = User.create!(name: "Joe", email: "ricky-t23@outlook.com", age: 50, password: "yoloppass232")

      delete "/api/v1/users/#{user1.id}"

      expect(response.status).to eq(204)
    end
  end
end


 
      




      


