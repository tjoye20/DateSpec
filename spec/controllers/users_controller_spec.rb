require 'rails_helper'

describe UsersController do
  let!(:users) {User.all}

  #below, at create. use ! to perform that action.
  let!(:user) {User.create!(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer.", question_1: "Test question 1.",
    question_2: "Test question 2.", question_3: "Test question 3.")}

  let!(:tasha) {User.create!(username: "Tasha", email: "t4tasha@test.com", password: "tashengineer",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer.", question_1: "Test question 1.",
    question_2: "Test question 2.", question_3: "Test question 3.")}

    describe "GET #index" do #not passing yet, b/c current_user is undefined
      it "responds with status code 200" do
        get :index
        expect(response).to be_success
        expect(assigns(:users)).to eq([tasha]) #only 1 user created
        expect(response).to have_http_status 200
        expect(response).to render_template(:index)
      end
    end

    describe "GET #new" do
      it "responds with status code 200" do
        get :new
        expect(response).to be_success
        expect(assigns(:user)).to be_a_new User
        expect(response).to have_http_status 200
        expect(response).to render_template(:new)
      end
    end

    describe "GET #show" do
      it "responds with status code 200" do
        get :show, {id: 1}
        expect(response).to be_success
        expect(assigns(:user)).to eq(user)
        expect(response).to have_http_status 200
        expect(response).to render_template(:show)
      end
    end

    describe "GET #edit" do
      it "responds with status code 200" do
        get :edit, {id: 1}
        expect(response).to be_success
        expect(assigns(:user)).to eq(user)
        expect(response).to have_http_status 200
        expect(response).to render_template(:edit)
      end
    end



end
