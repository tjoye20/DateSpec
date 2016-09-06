require 'rails_helper'

RSpec.describe Admirer, type: :model do
  let(:user) { User.create(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer. I like long walks on the beach.", question_1: "Do you want kids?.",
    question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?") }
  let(:user2) { User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
    gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Do you like cats?",
    question_2: "Have you ever been married?", question_3: "Do you have any kids?") }
  let(:admirer) { Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: "Yes, I want kids.", q2_response: "Woo, that's a long convo I'd prefer to
    have in person, so nothing gets miscrontrued.", q3_response: "No, I don't have any kids!")}

  let(:admirer2) { Admirer.create(user_id: user2.id, admirer_id: user.id, q1_response: nil, q2_response: "Yes, recently divorced.", q3_response: nil)}

  context "when valid params are passed" do
    it "creates a new admirer" do
      expect(admirer.user_id).to eq user.id
      expect(admirer.admirer_id).to eq user2.id
      expect(admirer.q1_response).to eq "Yes, I want kids."
    end
  end


  context "when invalid params are passed" do
    it "doesn't create a new admirer" do
      expect(admirer2.valid?).to eq false
      expect(admirer2.errors).to have_key :q1_response
    end
  end
end
