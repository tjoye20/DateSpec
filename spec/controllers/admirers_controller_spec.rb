require 'rails_helper'

describe AdmirersController do
  let(:user) {User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer.", question_1: "Do you want kids?.",
    question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?")}

  let(:user2) {User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Do you like cats?",
    question_2: "Have you ever been married?", question_3: "Do you have any kids?")}

  let(:admirer) { Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: "Yes, I want kids.", q2_response: "Woo, that's a long convo I'd prefer to
    have in person, so nothing gets miscrontrued.", q3_response: "No, I don't have any kids!")}

  before(:each) do
    session[:user_id] = user.id
  end

  let(:admirers) { Admirer.all }
  let(:new_admirer) { Admirer.new }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(admirers).to eq [admirer] #only 1 user created
      expect(response).to have_http_status 200
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to be_success
      expect(new_admirer).to be_a_new Admirer
      expect(response).to have_http_status 200
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, {id: user.id}
      expect(response).to be_success
      expect(admirer.admirer_id).to eq user2.id
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

      xit "responds with status code 302" do
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
      xit "responds with status code 200" do
        post :create, params
        expect(response).to have_http_status 200
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    xit "logs out user, clears the session, and sets active to false" do
      delete :destroy, {id: tasha.id}
      expect(session[:user_id]).to eq nil
      expect(assigns(:tasha)).to eq nil
      expect(response).to redirect_to root_path
    end
  end

end
