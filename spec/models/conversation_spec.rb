require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:user) { User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer. I like long walks on the beach.", question_1: "Do you want kids?.",
    question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?") }
  let(:user2) { User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Do you like cats?",
    question_2: "Have you ever been married?", question_3: "Do you have any kids?") }
  let(:convo) { Conversation.create(sender_id: user.id, recipient_id: user2.id) }
  let(:msg1) { Message.create(conversation_id: convo.id, body: "Hey, wassup?", user_id: user.id, read: true)}

    it "creates a conversation" do
      expect(convo.sender_id).to eq user.id
      expect(convo.recipient_id).to eq user2.id
      expect(convo.messages).to eq [msg1]
    end
end
