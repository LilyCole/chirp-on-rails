require "rails_helper"

describe "User API Tests" do
  it "GET /users should return 200" do
    get "/users"

    expect(response).to have_http_status(200)
  end

  it "POST /users should return 201" do
    post "/users", params: {
      user: {
        username: "Birdo",
        image: "birdo.jpg",
        password: "password"
      }
    }

    expect(response).to have_http_status(201)
  end

  it "POST /users should return 400 for bad request" do
    post "/users", params: {
      user: {
        username: "Birdo",
        image: "birdo.jpg"
      }
    }

    expect(response).to have_http_status(400)
  end

  it "GET /users/:id/edit should return 200" do
    user = User.create(username: "Birdo", image: "birdo.jpg", password: "password")
    
    get "/users/#{user.id}/edit"

    expect(response).to have_http_status(200)
  end

  it "PUT /users/:id/ should return 204" do
    user = User.create(username: "Birdo", image: "birdo.jpg", password: "password")

    put "/users/#{user.id}", params: {
      user: {
        username: "Birdo",
        image: "birdo.jpg",
        password: "password"
      }
    }

    expect(response).to have_http_status(204)
  end

  it "DELETE /users/:id/ should return 200" do
    user = User.create(username: "Birdo", image: "birdo.jpg", password: "password")
    
    delete "/users/#{user.id}"

    expect(response).to have_http_status(200)
  end
end
