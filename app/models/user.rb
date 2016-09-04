class User < ApplicationRecord
  has_secure_password

  validates_confirmation_of :password_digest
  validates_presence_of :password_digest, :on => :create
  validates_presence_of :email, :gender, :gender_seeking, :bio  
  validates_uniqueness_of :email

  validates_length_of :bio, :question_1, :question_2, :question_3, minimum: 10, too_short: "You entry was too short."
end
