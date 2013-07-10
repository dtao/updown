Up/Down
=======

I wanted something very simple for providing upvotes/downvotes to a website.

There are obviously other options out there (like Facebook, Google+, etc.); but they're all more complicated than what I wanted.

So I'm going to put this up on Heroku and see if it meets my needs.

Running locally
---------------

If you want to try this guy out yourself...

- run `bundle install`
- create a DB directory for sqlite: `mkdir db`
- run `rake dm:auto:migrate`
- change `updownHost` to `"http://localhost:4567/"` in **updown.js**
- create an **.env** file with the following variables for Foreman:
  - `SESSION_SECRET`: just set this to a really crazy long string (like 64 characters)
- run the server w/ `PORT=4576 foreman start`
- hit up localhost:4567 in your browser

Obviously, you don't have to use port 4567 if you don't want to.
