require 'rails_helper'

describe "message model" do
  let(:user) { User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer. I like long walks on the beach.", question_1: "Do you want kids?.",
    question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?") }
  let(:user2) { User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Do you like cats?",
    question_2: "Have you ever been married?", question_3: "Do you have any kids?") }
  let(:convo) { Conversation.create(sender_id: user.id, recipient_id: user2.id) }
  let(:msg1) { Message.create(conversation_id: convo.id, body: "Hey, wassup?", user_id: user.id, read: true)}

  let(:msg2) { Message.create(conversation_id: convo.id)}

  context "when valid params are passed" do
    it "belongs to a conversation" do
      expect(msg1.conversation_id).to eq convo.id
      expect(msg1.body).to eq "Hey, wassup?"
      expect(msg1.user_id).to eq user.id
      expect(msg1.read).to eq true
      expect(convo.id).to eq msg1.conversation_id
    end
  end

  context "when invalid params are passed" do
    it "does not save the message" do
      expect(msg2.valid?).to eq false
      expect(msg2.errors).to have_key(:body)
      expect(msg2.errors).to have_key(:user_id)
    end
  end

end
