class User < ApplicationRecord
  has_secure_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  validates_length_of :bio, :question_1, :question_2, :question_3, minimum: 10, too_short: "You entry was too short."
end
