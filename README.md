# DateSpec

Test-driven dating app to help you find your full-stack partner.

### Project Description

This app uses "tests" to help you determine if you want to engage with potential suitors, by allowing you to chat with them only if both of submitted responses to each other's profile questions.

#### Example Login Account

Email: tjoye20@gmail.com

Password: password

### Installation
To install the app to your local computer run

    git clone https://github.com/tjoye20/DateSpec.git

##### Install the necessary gems

    bundle install

##### Create and migrate your database

    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed

##### To run the RSpec tests

    bundle exec rspec spec

##### To launch the app

    rails s

### How To Use

Create your dating profile by signing up. Once signed up, you'll see a list of users that match your gender preference, and you can browse by bio and profile questions.

Submitting a response to a user's profile questions sends them an email notification, meaning you'll also be notified if they decide they're interested in you and answer your questions.

Both users have to submit the other interested party's responses before they're allowed to chat with each other.

### Remaining Backlog Items

* Add Github OAuth.
* Add Cloudinary so users can upload photos.
* Add UI using Semantic-UI.
