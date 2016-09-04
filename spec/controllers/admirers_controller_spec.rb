require 'rails_helper'

describe AdmirersController do
  let!(:user) {User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer.", question_1: "Test question 1.",
    question_2: "Test question 2.", question_3: "Test question 3.")}
  let!(:user2) {User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Test question 1.",
    question_2: "Test question 2.", question_3: "Test question 3.")}

  let!(admirer){Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: , q2_response: , q3_response:)}

  before(:each) do
    session[:user_id] = user.id
  end

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(assigns(:users)).to eq(user.id) #only 1 user created
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
      get :show, {id: user.id}
      expect(response).to be_success
      expect(assigns(:user)).to eq(user)
      expect(response).to have_http_status 200
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      let :params do
        {user: {username: "Tom", email: "t4tom@test.com", password_digest: "tomdancer",
        gender: "male", gender_seeking: "female", bio: "American. Dancer.", question_1: "Test question 1.",
        question_2: "Test question 2.", question_3: "Test question 3."}}
      end

      it "responds with status code 302" do
        expect{post(:create, params)}.to change(User, :count).by(1)
        expect(response).to have_http_status 302
        expect(session[:user_id]).to eq(User.last.id)
        expect(flash[:notice]).to eq("Signup successful!")
        expect(response).to redirect_to users_path
      end
    end

    context "when invalid params are passed" do
      let :params do
        {user: {username: "Tom", email: "t4tom@test.com"}}
      end
      it "responds with status code 200" do
        post :create, params
        expect(response).to have_http_status 200
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "logs out user, clears the session, and sets active to false" do
      delete :destroy, {id: tasha.id}
      expect(session[:user_id]).to eq nil
      expect(assigns(:tasha)).to eq nil
      expect(response).to redirect_to root_path
    end
  end

end
