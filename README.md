![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Rails Overview

## Objectives

By the end of this lesson, students should be able to:

- Explain why a back-end is necessary.
- List some of the responsibilities of a typical back-end, and identify which components within (R)MVC map to those responsibilities.
- Map (R)MVC roles to specific components of Rails.
- Indicate where different types of files can be found within a Rails application.
- Create a new Rails application using `rails new`.

## Prerequisites

- Ruby basics
- Ruby objects and classes
- HTTP

## Who Needs A Back-End?

In Unit 1, each of you built a front-end application; it had a UI and behavioral logic, allowing users to play Tic Tac Toe in the browser. Isn't that enough? Why might we want a back-end?

One possible reason is that when two different people are served up a web page, they each have a _separate copy_ of everything on the page. As a result, if we have two users interacting with our app, _they can never interact with each other, or even be aware of each other_. That significantly hampers what our app is capable of doing.

Another possible reason is that we might want want to store the state of the game over time. What if we wanted to be able to 'save' our game, close the browser, walk away, and pick it up again the next day? Having a back-end where data is stored means that we can do just that.

> There are some workarounds that might allow us to have **persistence** (things being saved over time) in the browser alone; however, this is a more advanced topic, and won't be touched on today.

Fortunately, in the Unit 1 Project, you were given a pre-built back-end that could do all of those things. But how did it do them?

### Your Turn :: Design Your Own Back-End
In your squads, take fifteen minutes (and a patch of whiteboard), and write out all the different things that you think that the back-end to your Tic Tac Toe apps needed to do in order to work correctly. Then, once you've done this, take a second look at what you've written down. Assuming you were to try to build a Ruby program to handle all of these different tasks, what abstractions would you need? How would the different responsibilities be broken up? Make a list.

Once all groups are finished, we'll be sharing out our results and having a class-wide discussion.

### One Possible Solution :: (R)MVC
Suppose we wanted to build an back-end app that records a user's height and weight. It might work as follows:

1. A user interacts with a front-end application, triggering a POST, and this POST request contains data - specifically, the latest measurements of height and weight.
2. When the POST request is received by the server, the back-end app parses the request and extracts the relevant information.
3. The data from the POST request gets added to our records.
4. As confirmation, a JSON with a unique identifier (so we can refer to this specific measurement in the future) gets sent to the front end.

Our app can also retrieve records, like so:

1. Something on the front-end (probably driven by user interaction) triggers a GET request that asks for a specific record.
2. When the GET request is received by the server, the back-end app parses the request and identifies which measurement record is being requested.
3. The data for the desired measurement gets retrieved from our set of records.
4. Finally, the desired data gets put into a JSON and sent back to the front end.

If we were to try to generalize and abstract away the differences between these two steps, we might say that our web application needs to:

- receive incoming requests from a front-end
- execute specific behaviors in response to those requests
- create, read, update, or destroy data records through some kind of data storage system
- share information back to the browser

> The quartet of 'create', 'read', 'update', and 'destroy' is commonly known as 'CRUD'; each refers to a specific type of action that can be performed on our data storage system. Each of these types might have more than one specific action associated with it ('read one' vs 'read all', for instance). More on this very soon...

One common way of dividing up these four responsibilities is the '**MVC**' (_Model-View-Control_) architecture pattern. This pattern involves making three core types of components, each responsible for a different part of the app's functionality.

A **Model** directly manages the data in our application, and provides a representation of that data for the rest of the application to use.

A **View** is like it sounds - it's data that gets sent back to the client for the user to consume.

A **Controller** responds to user requests as they come in, and utilizes both the model and the view components to perform the desired behavior and produce a response.

In addition to these three types of components, however, there is a fourth piece that it's important to consider with web apps in particular - **routing**. **Routes** indicate to the server which controllers should be triggered (and how) by which kinds of requests. It's a critical piece of the puzzle, and one we'll be looking at later today in more detail.

(R)MVC architecture is very common in web applications, and Rails (as we'll soon see) gives us the tools to spin up applications that are roughly in line with the idea of (R)MVC.

#### Your Turn :: Act Out an (R)MVC Back-End
We're going to act our the various parts of an (R)MVC application. Link up with another squad so that you're in a group of roughly seven, and assign each member of your 'super-group' one of the roles below. Use the nametags provided. These roles are:
- Server
- Controllers
  * People Controller
  * Places Controller
  * Things Controller
- Models
  * People Model
  * Places Model
  * Things Model

Once you've divvied up the roles, take two minutes to read through the directions for your role, found `./roles`; these directions explain what your responsibilities are and how you should carry them out. However, **you may only communicate with the teammates listed in your role card**.

We'll work through one example request together, and then each super-group will work independently to answer all remaining requests. Once all groups have finished, we'll have a discussion about how everything went, what made sense, and what didn't make sense.

## (R)MVC with Rails

**Rails** is a web framework - a tool that helps us quickly and easily build web applications - written in Ruby, and designed and created by a Danish programmer named David Heinemeier Hannson (also known as 'DHH'). Although Rails applications don't match up perfectly with the abstract idea of MVC, their architecture is fairly similar.

Let's take a look at an actual Rails app and see how it lines up. Fork and clone [this repo](https://github.com/ga-wdi-boston/rails-tic-tac-toe-api). Recognize it? It's your Tic Tac Toe back-end from Project 1! Now open it up in Sublime - you should see a file structure like this:

```bash
.
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── Procfile
├── README.md
├── README.rdoc
├── Rakefile
├── app
│   ├── assets
│   │   ├── images
│   │   └── stylesheets
│   │       └── application.css
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── concerns
│   │   ├── games_controller.rb
│   │   ├── open_read_controller.rb
│   │   ├── protected_controller.rb
│   │   └── users_controller.rb
│   ├── helpers
│   │   └── application_helper.rb
│   ├── mailers
│   ├── models
│   │   ├── concerns
│   │   │   ├── authentication.rb
│   │   │   ├── listen_notify.rb
│   │   │   └── tic_tac_toe_validation.rb
│   │   ├── game.rb
│   │   └── user.rb
│   ├── serializers
│   │   ├── game_serializer.rb
│   │   └── user_serializer.rb
│   └── views
│       └── layouts
│           └── application.html.erb
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   └── setup
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── backtrace_silencers.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── session_store.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   ├── puma.rb
│   ├── routes.rb
│   └── secrets.yml
├── config.ru
├── db
│   ├── migrate
│   │   ├── 20150602144919_create_users.rb
│   │   └── 20150626193830_create_games.rb
│   ├── schema.rb
│   └── seeds.rb
├── lib
│   ├── assets
│   └── tasks
├── log
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── favicon.ico
│   └── robots.txt
└── vendor
    └── assets
        ├── scripts
        │   └── resource-watcher-0.1.0.js
        └── stylesheets

```

There are a **ton** of things in here, so let's take a step back and just look at directories at the top level of the app.

```bash
.
├── app
├── bin
├── config
├── db
├── lib
├── log
├── public
└── vendor
```

* The `app` directory holds the code for our application itself. We'll be writing a lot of code here.
* `bin` holds the binary code for Rails itself, as well as some of the programs that it depends on - better not touch this directory.
* `config` holds configuration settings for our app and for the things that plug into it. This includes things like environmental variable settings and secret keys, but also things like the routing configuration for our server (which is not strictly part of our Rails app, but which our app uses); **the `routes.rb` file, in particular, defines all of the routing for our app.**
* `db` holds files related to the structure of the application's database. The database, like the server, is separate from Rails and is not strictly part of the app, so it makes sense to keep this outside of the `app` directory.

    > More on this soon.

* `log` is a place where Rails keeps its log files - records of things that have happened when the app was running. Looking through here can sometimes be helpful if you've hit a bug.
* `public` holds some static HTML pages that anyone can see, regardless of whether or not they're logged into our app. These are typically pages that represent different errors our app might have hit, such as `404`.
* `vendor` holds non-gem software that our app will use. Don't worry too much about this one for now.

For now, you only need to think about `app`, `config`, and `db` - you probably won't be touching any code outside of those three directories. How is that possible? Because Rails actually builds out most of these files and folders for you, every time you use it to create a new application. That's why it's called a 'framework' - it gives you the skeleton for a brand new app, which you can then customize.

Let's dive into the `app` directory. This app in particular has more going on than yours probably will, but it still has all the basic components.

```bash
./app
├── assets
│   ├── images
│   └── stylesheets
│       └── application.css
├── controllers
│   ├── application_controller.rb
│   ├── concerns
│   ├── games_controller.rb
│   ├── open_read_controller.rb
│   ├── protected_controller.rb
│   └── users_controller.rb
├── helpers
│   └── application_helper.rb
├── mailers
├── models
│   ├── concerns
│   │   ├── authentication.rb
│   │   ├── listen_notify.rb
│   │   └── tic_tac_toe_validation.rb
│   ├── game.rb
│   └── user.rb
├── serializers
│   ├── game_serializer.rb
│   └── user_serializer.rb
└── views
    └── layouts
        └── application.html.erb
```
Three of these directories should jump out at you: `controllers`, `models`, and `views`. Each holds the different Ruby files that Rails uses to handle the respective responsibilities of MVC.

Don't worry about `assets`, `serializers`, `mailers`, or `helpers` for now.

### Your Turn :: (R)MVC with Rails

Now that you've seen a fully built-out Rails app, let's a look at a brand new one, hot off the presses.

First, navigate to the folder you keep your project folders, and open up SublimeText at that location.

```
subl .
```

Then, run the following command :

```
rails new my_first_rails_app --database=postgresql
```

In your squads, take a look at all the files that have just been created. Then, compare this new project alongside the Tic Tac Toe API, and come up with a list of ten differences and ten similarities between the two projects; we'll talk through these lists together as a class.

## Additional Resources

- **[RailsGuides](http://guides.rubyonrails.org/getting_started.html)**
- **[Official Rails Documentation](http://rubyonrails.org/documentation/)**
- **[MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)**
