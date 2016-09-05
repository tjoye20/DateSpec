require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  let!(:user) { User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer. I like long walks on the beach.", question_1: "Do you want kids?.",
    question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?") }
  let!(:user2) { User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Do you like cats?",
    question_2: "Have you ever been married?", question_3: "Do you have any kids?") }
  let!(:user3) { User.create(username: "Bethy", email: "bethy@test.com", password: "password",
   gender: "female", gender_seeking: "male", bio: "Egyptian. Architect. I love to cook.", question_1: "Test question 1.",
   question_2: "Test question 2.", question_3: "Test question 3.")}
  before(:each) do
    session[:user_id] = user.id
  end
  let!(:existing_convo) { Conversation.create(sender_id: user2.id, recipient_id: user3.id) }
  let!(:new_convo) { Conversation.new}
  let(:all_convos) {Conversation.all}
  let(:all_users) {User.all}


  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status 200
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    context "when starting a new conversation" do
      let :params do
        {sender_id: user.id, recipient_id: user2.id}
      end
      it "responds with status code 302" do
        expect{post(:create, params)}.to change(Conversation, :count).by(1)
        expect(response).to have_http_status 302
        expect(response).to redirect_to conversation_messages_path(all_convos.last)
      end
    end

    context "when a conversation exists already" do
      let :params do
        {sender_id: user3.id, recipient_id: user2.id}
      end
      it "responds with status code 302" do
        expect{post(:create, params)}.to change(Conversation, :count).by(0)
        expect(response).to have_http_status 302
        expect(response).to redirect_to conversation_messages_path(existing_convo.id)
      end
    end
  end

end
