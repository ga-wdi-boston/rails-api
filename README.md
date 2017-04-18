[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Rails API Overview

## Objectives

By the end of this lesson, developers should be able to:

-   Explain why an API is necessary.
-   List some of the responsibilities of a typical API, and identify which
    components within MVC map to those responsibilities.
-   Diagram the process flow from Client through Database and back
-   Map MVC roles to specific components of Rails.
-   Indicate where different types of files can be found within a Rails
    application.
-   Recall how to use `rails generate` for starting `models`, `controllers`,
    and `serializers`.

## Preparation

-   Run `gem install rails`

## Prerequisites

-   [Ruby Object Inheritance](https://github.com/ga-wdi-boston/ruby-object-inheritance)
-   [HTTP & JSON](https://github.com/ga-wdi-boston/http-json-discussion)

## Who Needs An API

By now, you've built a client application: it had a user interface (UI) and
behavioral logic, allowing users to play Tic-Tac-Toe in the browser. Isn't that
enough? Why might we want an API?

One possible reason is that when two different people are served up a web page,
they each have a separate copy of everything on the page. As a result, if we
have two users interacting with our app, they can never interact with each
other, or even be aware of each other.

Another possible reason is that we might want want to store the state of the
game over time. What if we wanted to be able to 'save' our game, close the
browser, walk away, and pick it up again the next day? Having an API where
data is stored means that we can do just that. This is known as
**persistence** (things being saved over time).

For your client, we provided an API that could do all that. But how did it
work?

## Lab - Design Your Own API

In your squads, take ten minutes (and a patch of whiteboard), and write out all
the different things that you think that the API for your Tic-Tac-Toe clients
needed to do in order to work correctly.

Then, once you've done this, take a second look at what you've written down.
Assuming you were to try to build a Ruby program to handle all of these
different tasks, what abstractions would you need? How would the different
responsibilities be broken up? Make a list. It doesn't matter how "correct" it
is. For this part, recall our strategies in modeling. What are the relevant
nouns and verbs?  Big ideas and details?

Once all groups are finished, we'll discuss our results.

## One Possible Solution - Model-View-Controller

Suppose we wanted to build an API app that records a user's height and
weight. It might work as follows:

1.  A user interacts with a front-end application, triggering a POST, and this
    POST request contains data - specifically, the latest measurements of
    height and weight.
1.  When the POST request is received by the server, the API app parses the
    request and extracts the relevant information.
1.  The data from the POST request gets added to our records.
1.  As confirmation, a JSON with a unique identifier (so we can refer to this
    specific measurement in the future) gets sent to the front end.

Our app can also retrieve records, like so:

1.  Something on the front-end (probably driven by user interaction) triggers a
    GET request that asks for a specific record.
1.  When the GET request is received by the server, the API app parses the
    request and identifies which measurement record is being requested.
1.  The data for the desired measurement gets retrieved from our set of
    records.
1.  Finally, the desired data gets put into a JSON and sent back to the front
    end.

If we were to try to generalize and abstract away the differences between these
two steps, we might say that our web application needs to:

-   receive incoming requests from a front-end
-   execute specific behaviors in response to those requests
-   create, read, update, or destroy data records through some kind of data
    storage system
-   share information back to the browser

The quartet of 'create', 'read', 'update', and 'destroy' is commonly known as
'CRUD'; each refers to a specific type of action that can be performed on our
data storage system. Each of these types might have more than one specific
action associated with it ('read one' vs 'read all', for instance).

One common way of dividing up these four responsibilities is the
**Model-View-Controller** (MVC) architecture pattern. This pattern involves
making three core types of components, each responsible for a different part of
the API's functionality.

A **Model** directly manages the data in our application, and provides a
representation of that data for the rest of the application to use.

A **View** is like it sounds - it's data that gets sent back to the client for
the user to consume.

A **Controller** responds to user requests as they come in, and utilizes both
the model and the view components to perform the desired behavior and produce a
response.

In addition to these three types of components, however, there is a fourth
piece that it's important to consider with web development particularly:
routing. **Routes** indicate to the server which controllers should be
triggered (and how) by which kinds of requests. It's a critical piece of the
puzzle, and one we'll be looking at later today in more detail.

What which part(s) of an HTTP request does the router use to determine which
code to run?

MVC architecture is very common in web applications, and Rails gives us the
tools to spin up applications that are roughly in line with the idea of MVC.

## Lab - Act Out an MVC API

We're going to act out the various parts of an MVC application. Link up with
another squad so that you're in a group of eight, and assign each member of
your 'super-group' one of the roles below. These roles are:

-   Client
-   Server
-   Controllers

   -   People Controller
   -   Places Controller
   -   Things Controller

-   Models

   -   People Model
   -   Places Model
   -   Things Model

Once you've divvied up the roles, take two minutes to read through the
directions for your role, found [`./roles`]('./roles'). These directions
explain what your responsibilities are and how you should carry them out.
However, **you may only communicate with the teammates listed in your role
card**.

We'll work through one example request together, and then each group will work
independently to answer all remaining requests. Once all groups have finished,
we'll have a retro-style discussion about how everything went.

## MVC with Rails

Rails is a web framework - a tool that helps us quickly and easily build
web applications - written in Ruby, and designed and created by David
Heinemeier Hannson (also known as 'DHH'). Although Rails applications don't
match up perfectly with the abstract idea of MVC, their architecture is fairly
similar.

Let's take a look at an actual Rails app and see how it lines up. Fork and
clone [this repo](https://github.com/ga-wdi-boston/game-project-api). Recognize
it? It's the Tic-Tac-Toe API!

Open it up in Atom. Have a look at the file structure. Let's take a step back
and just look at directories at the top level of the app.

```sh
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

For now, you only need to think about `app`, `config`, and `db` - you probably
won't be touching any code outside of those three directories. How is that
possible? Because Rails actually builds out most of these files and folders for
you, every time you use it to create a new application. That's why it's called
a 'framework' - it gives you the skeleton for a brand new app, which you can
then customize.

-   The `app` directory holds the code for our application itself. We'll be
    writing a lot of code here.
-   `bin` holds the binary code for Rails itself, as well as some of the
    programs that it depends on - better not touch this directory.
-   `config` holds configuration settings for our app and for the things that
    plug into it. This includes things like environmental variable settings and
    secret keys, but also things like the routing configuration for our server
    (which is not strictly part of our Rails app, but which our app uses);
    the `routes.rb` file, in particular, defines all of the routing for our
    app.
-   `db` holds files related to the structure of the application's database.
    The database, like the server, is separate from Rails and is not strictly
    part of the app, so it makes sense to keep this outside of the `app`
    directory.
-   `log` is a place where Rails keeps its log files - records of things that
    have happened when the app was running. Looking through here can sometimes
    be helpful if you've hit a bug.
-   `public` holds some static HTML pages that anyone can see, regardless of
    whether or not they're logged into our app. These are typically pages that
    represent different errors our app might have hit, such as `404`.
-   `vendor` holds non-gem software that our app will use. Don't worry too much
    about this one for now.

Let's dive into the `app` directory. This app in particular has more going on
than yours probably will, but it still has all the basic components.

```bash
./app
├── channels
├── controllers
├── jobs
├── mailers
├── models
├── serializers
└── views
```

Three of these directories should jump out at you: `controllers`, `models`, and
`views`. Each holds the different Ruby files that Rails uses to handle the
respective responsibilities of MVC.

Don't worry about `assets`, `serializers`, `mailers`, or `helpers` for now. In
API-style applications, `serializers` replace all the views that we care about
for this program, so we can safely skip the `views` folder as well.

## Demo: Building our first Rails App

Now that we've conceptually wrapped our heads around what goes into a backend
lets make one ourselves.

**WARNING:** Do not ask "why?". None of this should "make sense", yet. Instead,
focus on the commands I'm running and watch how Rails automatically organizes
our code. The `rails generate` commands are particularly interesting.

### Creating a Blog API

-   Use the quite-excellent [Rails API
    Template](https://github.com/ga-wdi-boston/rails-api-template), already
    included in this repository for our convenience.
-   Scaffold our Posts and Comments (Users come with the template!)
    -   `bin/rails generate scaffold post title:string body:text
        user:references`
    -   `bin/rails generate scaffold comment body:text user:references
        post:references`
-   Now lets create and migrate our database by typing in:
    -   `bin/rake db:create`
    -   `bin/rake db:migrate`
-   Start the server! `bin/rails server`
-   Now navigate to `localhost:4741/users` (empty brackets is a good sign)
-   Let's actually see some data, by adding it to our `db/examples.rb` file.
    ```ruby
    %w(alice bob charlie dana).each do |name|
      email = "#{name}@#{name}.com"
      next if User.exists? email: email
      User.create!(email: email, password: 'abc123', password_confirmation: nil)
    end

    %w(alice bob dana).each_with_index do |name, i|
      title = "Dear Diary Number #{i}"
      email = "#{name}@#{name}.com"
      user = User.find_by(email: email)
      next if Post.exists? title: title, user_id: user.id
      Post.create!(title: title, body: "Another beautiful day!", user_id: user.id)
    end

    %w(charlie).each do |name|
      body = "Great post!"
      email = "#{name}@#{name}.com"
      user = User.find_by(email: email)
      post = User.find_by(email: "dana@dana.com").posts.first
      next if Comment.exists? body: body, user_id: user.id
      Comment.create!(body: body, user: user, post_id: post.id)
    end
    ```

-   Now we have to update the models with relationships. Put the following in
    the user model (`model/user.rb`):
    ```ruby
    class User < ActiveRecord::Base
      has_many :posts
      has_many :comments
    end
    ```

-   And add this to the post model (`model/post.rb`):
    ```ruby
    class Post < ActiveRecord::Base
      has_many :comments
    end
    ```

-   Now fill the database with examples by running `bin/rake db:examples`
-   If we need to reset entirely, `bin/rake db:drop db:create db:migrate
    db:seed db:examples`
-   Try navigating to `localhost:4741/users` or `/posts` or `/comments`. You
    should see the JSON you seeded. Try making a curl request to send JSON to
    your API:
    ```bash
    curl http://localhost:4741/posts \
    --include \
    --request POST \
    --header "Content-Type: application/json" \
    --data '{
        "post": {
          "title": "a sample title",
          "body": "a sample body"
        }
      }'
    ```

-   Navigate to `localhost:4741/users` and see what we have.  In the serializer
    files try adding more `attributes` as keys, and see how this changes.
    (check the `db/schema` file for some ideas.)
-   After adding attribute fields to the user, post and comment serializers
    add a `has_many` relationship to user serializer to match the relationship
    added to the user model.

## Tasks

Developers should run these often!

-   `bin/rake routes` lists the endpoints available in your API.
-   `bin/rake test` runs automated tests.
-   `bin/rails console` opens a REPL that pre-loads the API.
-   `bin/rails db` opens your database client and loads the correct database.
-   `bin/rails server` starts the API.
-   `scripts/*.sh` run various `curl` commands to test the API. See below.

<!-- TODO -   `rake nag` checks your code style. -->
<!-- TODO -   `rake lint` checks your code for syntax errors. -->

## Additional Resources

-   [RailsGuides](http://guides.rubyonrails.org/getting_started.html)
-   [Official Rails Documentation](http://rubyonrails.org/documentation/)
-   [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)
-   [JSON API](https://thesocietea.org/2015/02/building-a-json-api-with-rails-part-1-getting-started/)

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
