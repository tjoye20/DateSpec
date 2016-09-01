# DateSpec

Test-driven dating app to help you find your full-stack partner.

NOTE: THIS APP IS STILL IN DEVELOPMENT. Using TDD to develop the app.

### Project Description

This app uses "tests" to help you determine if you want to engage with potential suitors, by allowing you to chat with them only if you approve of their responses to the questions on your profile page. Note: both users have to approve of each other's responses before they can chat with each other.

### Installation
To install the app to your local computer run

    git clone https://github.com/tjoye20/DateSpec-Rails.git

##### Install the necessary gems

    bundle install

##### Create and migrate your database

    bundle exec rake db:create
    bundle exec rake db:migrate

##### To run the RSpec tests

    bundle exec rspec spec

##### To launch the app

    rails s

### How To Use

Create your dating profile by signing up. Once signed up, you'll see a list of users that match your gender preference, and you can browse by bio and profile questions.

Submitting a response to a user's profile questions sends them an email notification, meaning you'll also be notified if they decide they're interested in you and answer your questions.

Both users have to submit the other interested party's responses before they're allowed to chat with each other.

### Future Slices

* Add Github OAuth.
* Add Cloudinary so users can upload photos.
* Add ActionMailer to email users when someone submits. responses to their profile questions.
* Add UI using Refills.
* Add chat feature.
