# Private events application

This application allows users to create events and then manage user signups. Users can create events and send invitations and parties. Events take place at a specific date and at a location.

A user can create events. A user can attend many events. An event can be attended by many users.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, visit the site
[*Sample App* by me](https://rai-sampleapp.herokuapp.com/).
