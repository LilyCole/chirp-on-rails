require "rails_helper"

describe "Chirp API Tests" do

  it "GET /chirps should return 200" do
    get "/chirps"

    expect(response).to have_http_status(200)
  end

  it "POST /chirps should return 201" do
    user = User.create(username:"test",image:"test.jpg",password:"password")
    
    post "/chirps", params: {
      chirp: {
        user_id: user.id,
        content: "This is a test chirp."
      }
    }

    expect(response).to have_http_status(201)
  end

end