# DateSpec

Test-driven dating app help you find your full-stack partner.

NOTE: THIS APP IS STILL IN DEVELOPMENT. Using TDD to develop the app.

### Project Description

This app allows students and mentors to collaborate on times to mentor each other and change the world.  

### Installation
To install the app to your local computer run

    git clone https://github.com/tjoye20/DateSpec-Rails.git

##### Install the necessary gems

    bundle install

##### Create and migrate your database

    rake db:create
    rake db:migrate

### How To Use

Create your dating profile by signing up. Once signed up, you'll see a list of users that match your gender preference, and you can browse by bio and profile questions.

Submitting a response to a user's profile questions sends them an email notification, meaning you'll also be notified if they decide they're interested in you and answer your questions.

Both users have to submit the other interested party's responses before they're allowed to chat with each other.

##### To run the RSpec tests

    rspec spec

### Future Slices

* Add Github OAuth  
* Add ActionMailer to email users when someone submits responses to their profile questions.
* Add UI
