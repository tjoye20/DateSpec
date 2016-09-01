require 'rails_helper'

describe UsersController do
  let!(:users) {User.all}
  let!(:user) {User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer.", question_1: "Test question 1.",
    question_2: "Test question 2.", question_3: "Test question 3.")}

    describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(assigns(:users)).to eq([user]) #only 1 user created
      expect(response).to have_http_status 200
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
  it "responds with status code 200" do
    get :index
    expect(response).to be_success
    expect(assigns(:users)).to eq([user]) #only 1 user created
    expect(response).to have_http_status 200
    expect(response).to render_template(:index)
  end
end




end
