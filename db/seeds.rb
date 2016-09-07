# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# run be rake db:reset whenever you make updates to the seed data


user = User.create(username: "tj", email: "tjoye20@gmail.com", password: "password",
  gender: "male", gender_seeking: "female", bio: "Nigerian. Developer. I like long walks on the beach.", question_1: "Do you want kids?.",
  question_2: "What do you think of the #BlackLivesMatter movement?", question_3: "Are you open to adoption?")
user2 = User.create(username: "Tasha", email: "t4tasha@test.com", password: "password",
  gender: "female", gender_seeking: "male", bio: "Jamaican. Engineer. I love cats!", question_1: "Do you like cats?",
  question_2: "Have you ever been married?", question_3: "Do you have any kids?")

user3 = User.create(username: "tom", email: "tom@test.com", password: "password",
 gender: "male", gender_seeking: "female", bio: "Canadian. Jogger. I workout 5x a week.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")
user4 = User.create(username: "Bethy", email: "bethy@test.com", password: "password",
 gender: "female", gender_seeking: "male", bio: "Egyptian. Architect. I love to cook.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")

user5 = User.create(username: "Jacob", email: "jacob@test.com", password: "password",
 gender: "male", gender_seeking: "female", bio: "Texan. Cowboy fan. Don't bother if you're not a Cowboys fan.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")
user6 = User.create(username: "Anna", email: "anna@test.com", password: "password",
 gender: "female", gender_seeking: "male", bio: "New Yorker. Empire state of mind. Adrenaline junky.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")

user7 = User.create(username: "Raymond", email: "ray@test.com", password: "password",
 gender: "male", gender_seeking: "male", bio: "Cameroonian. Lawyer. I hate moral absolutes.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")
user8 = User.create(username: "Christina", email: "christina@test.com", password: "password",
 gender: "female", gender_seeking: "female", bio: "Nigerian. Doctor. Igbo.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")

user9 = User.create(username: "Bob", email: "bob@test.com", password: "password",
 gender: "male", gender_seeking: "male", bio: "Jamaican. Engineer. Usain Bolt's cousin..", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")
user10 = User.create(username: "Liz", email: "liz@test.com", password: "password",
 gender: "female", gender_seeking: "female", bio: "Ghanian. Accountant. Ready to settle down.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")

user11 = User.create(username: "Billy", email: "billy@test.com", password: "password",
 gender: "male", gender_seeking: "male", bio: "Jamaican. Engineer. Usain Bolt's cousin..", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")
user12 = User.create(username: "Lisa", email: "lisa@test.com", password: "password",
 gender: "female", gender_seeking: "female", bio: "Italian. Resturanteur.", question_1: "Test question 1.",
 question_2: "Test question 2.", question_3: "Test question 3.")


Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: "Test response.", q2_response: "test response 2", q3_response: "rest response 3.")
Admirer.create(user_id: user2.id, admirer_id: user.id, q1_response: "Test response.", q2_response: "test response 2", q3_response: "rest response 3.")
#
Admirer.create(user_id: user.id, admirer_id: user4.id, q1_response: "Test response.", q2_response: "test response 2", q3_response: "rest response 3.")
Admirer.create(user_id: user4.id, admirer_id: user.id, q1_response: "Test response.", q2_response: "test response 2", q3_response: "rest response 3.")
#

convo = Conversation.create(sender_id: user.id, recipient_id: user2.id)
# convo2 = Conversation.create(sender_id: user4.id, recipient_id: user.id)

Message.create(conversation_id: convo.id, body: "Hey Tasha, wassup?", user_id: convo.sender_id, read: true)
Message.create(conversation_id: convo.id, body: "Nothing much, wyd?", user_id: convo.recipient_id, read: true)
# Message.create(conversation_id: convo2.id, body: "Hey Tj, how are you?", user_id: convo2.sender_id, read: true)

# admirer = Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: , q2_response: , q3_response:)
# admirer = Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: , q2_response: , q3_response:)
# admirer = Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: , q2_response: , q3_response:)
# admirer = Admirer.create(user_id: user.id, admirer_id: user2.id, q1_response: , q2_response: , q3_response:)
