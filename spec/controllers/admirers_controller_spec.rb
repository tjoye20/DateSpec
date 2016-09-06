require 'rails_helper'

describe AdmirersController do
  let!(:user) {User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer.", question_1: "Do you want kids?.",
    question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?")}

  let!(:user2) {User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Do you like cats?",
    question_2: "Have you ever been married?", question_3: "Do you have any kids?")}

  let!(:admirer) { Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: "Yes, I want kids.", q2_response: "Woo, that's a long convo I'd prefer to
    have in person, so nothing gets miscrontrued.", q3_response: "No, I don't have any kids!")}

  before(:each) do
    session[:user_id] = user.id
  end

  let(:admirers) { Admirer.all }
  let(:new_admirer) { Admirer.new }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index, user_id: user.id
      expect(response).to be_success
      expect(admirers).to eq [admirer]
      expect(response).to have_http_status 200
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new, user_id: user.id
      expect(response).to be_success
      expect(new_admirer).to be_a_new Admirer
      expect(response).to have_http_status 200
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, user_id: user.id, id: admirer.id
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

      # expect{post :create, conversation_id: convo.id, message: {body: "Hey, wassup?", user_id: user.id}}.to change(Message, :count).by(1)

      xit "responds with status code 302" do
        # expect{post(:create, params: {:user}, , user_id: user.id)}.to change(User, :count).by(1)
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
    it "sets user_approved to false" do
      delete :destroy, user_id: user.id, id: admirer.admirer_id
      expect(admirer.user_approved).to eq false
      expect(response).to redirect_to user_admirer_path
    end
  end

end
