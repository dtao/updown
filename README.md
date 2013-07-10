Up/Down
=======

I wanted something very simple for providing upvotes/downvotes to a website.

There are obviously other options out there (like Facebook, Google+, etc.); but they're all more complicated than what I wanted.

So I'm going to put this up on Heroku and see if it meets my needs.

Running locally
---------------

If you want to try this guy out yourself...

- run `bundle install`
- uncomment the `get '/demo'` line in **app.rb**
- change `updownHost` to `"http://localhost:4567/" in **updown.js**
- run the server w/ `PORT=4576 foreman start`
- hit up localhost:4567/demo in your browser

Obviously, you don't have to use port 4567 if you don't want to.
