##Hello there

This is a sample application called **Ruby BookShelf**.

It was created as a test app and the main goal was to show that I'm a **Ruby** developer after all.
It includes 

*  user authentication/authorization 
*  role managment
*  supports RESTful JSON API
*  includes sample Ember.js app for easier interactions


##Initial setup
Given that you've already downloaded this project

Visit project directory

```
$ cd /path/to/project 
```
Install all required libraries and setup database (including seed files)

```
$ bundle install
$ rake db:setup 
```

Start the app

```
$ rails s
```

Visit ```localhost:3000``` and login as **admin, user  or gest** using 

```
email: #{role}@mail.com
password: 123456
```

---
**N.B.**

Usually I prefer to use ```gem 'devise'``` for user authentication,  ```gem 'cancan'``` for user role mgmt and ```gem 'rails-api'``` for creating json API's as they provide documented and well tested methods for faster setup and development. 
But for this app I created everything from stratch to show that you don't always need third-party libraries (huh)