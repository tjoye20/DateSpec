require 'rails_helper'
require 'pry'

describe SessionsController do
  let!(:user) {User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer.", question_1: "Test question 1.",
    question_2: "Test question 2.", question_3: "Test question 3.")}

  context "when valid params are passed" do
    let :params do
        { :email => user.email, :password => user.password }
      end

    it "logs in the correct user and sets a session" do
      post :create, params
      expect(response).to have_http_status 302
      expect(session[:user_id]).to eq(user.id)
      expect(flash[:notice]).to eq("Logged in!")
      expect(response).to redirect_to root_path
    end
  end

  context "when invalid params are passed" do
    let :params do
        { :email => "test@test.com", :password => "wrong" }
      end
    it "returns you to the login page" do
      post :create, params
      expect(flash[:alert]).to eq("Invalid email or password")
      expect(response).to render_template("sessions/new", "layouts/application")
    end
  end


    it "logs you out and clears out the session" do
      post :destroy
      expect(session[:user_id]).to eq nil
      expect(flash[:notice]).to eq("Logged out!")
      expect(response).to redirect_to root_path
    end
end
