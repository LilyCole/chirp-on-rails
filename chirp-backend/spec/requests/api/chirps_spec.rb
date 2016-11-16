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

  it "POST /chirps should return 400 for bad request" do

    post "/chirps", params: {
      chirp: {
        user_id: 1,
        content: "This is a test chirp."
      }
    }

    expect(response).to have_http_status(400)
  end

  it "GET /chirps/:id/edit should return 200" do
    user = User.create(username:"test",image:"test.jpg",password:"password")
    chirp = user.chirps.create(content:"Test chirp!")

    get "/chirps/#{chirp.id}/edit"

    expect(response).to have_http_status(200)
  end

  it "PUT /chirps/:id should return 204" do
    user = User.create(username:"test",image:"test.jpg",password:"password")
    chirp = user.chirps.create(content:"Test chirp!")

    put "/chirps/#{chirp.id}", params: {
      chirp: {
        user_id: user.id,
        content: "Editing this chirp."
      }
    }

    expect(response).to have_http_status(204)
  end

  it "DELETE /chirps/:id/ should return 200" do
    user = User.create(username:"test",image:"test.jpg",password:"password")
    chirp = user.chirps.create(content:"Test chirp!")

    delete "/chirps/#{user.id}"

    expect(response).to have_http_status(200)
  end
  
end