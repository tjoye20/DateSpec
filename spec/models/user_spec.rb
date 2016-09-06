require 'rails_helper'

describe "User model" do
  let(:user) { User.create!(username: "tj", email: "test@test.com", password: "password",
    gender: "male", gender_seeking: "female", bio: "Nigerian. Developer. I like long walks on the beach.", question_1: "Do you want kids?.",
    question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?") }
  let(:saved_user) { User.find_by(username:"tj") }

  let!(:user2) { User.create(username:"jess", email:"jess@gmail.com", password: "password") }
  let(:saved_user2) { User.find_by(username:"jess") }

  context "when valid params are passed" do
    it "saves the user's information" do
      expect(user.username).to eq saved_user.username
      expect(user.email).to eq saved_user.email
      expect(user.password_digest).to eq saved_user.password_digest
      expect(user.gender).to eq saved_user.gender
      expect(user.gender_seeking).to eq saved_user.gender_seeking
      expect(user.question_1).to eq saved_user.question_1
      expect(user.question_2).to eq saved_user.question_2
      expect(user.question_3).to eq saved_user.question_3
      expect(User.find_by(email: "test@test.com")).to eq saved_user
      user.update_attributes(email: "jay@me.com")
      expect(user.email).to eq "jay@me.com"
    end
  end

    context "when invalid params are passed" do
      it "does not save the user's information" do
        expect(user2.valid?).to eq false
        expect(user2.errors).to have_key(:bio)
        expect(user2.errors).to have_key(:gender)
        expect(user2.errors).to have_key(:gender_seeking)
        expect(user2.errors).to have_key(:question_1)
        expect(user2.errors).to have_key(:question_2)
        expect(user2.errors).to have_key(:question_3)
      end
    end

end
