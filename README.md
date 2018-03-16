# Stub Stash

Take your cumbersome ticket collection and upload it to an interactive database.  This application allows you to load all of your live music events into your profile, and organize your data by artist and venue as well as viewing all of your attended venues on a single map.

## Tech Stacks
* Built with Ruby on Rails
* Database built with Postgresql
* Testing suite uses Rspec and Capybara
[![Coverage Status](https://coveralls.io/repos/github/abarnes26/stub_stash/badge.svg?branch=master)](https://coveralls.io/github/abarnes26/stub_stash?branch=master)
* Pages rendered with HTML & CSS

## APIs
* Spotify - Easily import a user's followed artists to their "Artist" page.
* Google Maps - Render locations of previously visited music venues on a google map on the user's dashboard.
* Jambase - Allows the user to search and locate venues based on zipcode or name and import those into their profile.

## Getting Started

### Creating a new account
As a new user landing on the home page, create a new account through the "Sign Up" link using your email and password of your choice.  After successfully creating an account, the user will be redirected to their dashboard.

### Adding Artists
Navigate to the "Artists" page via the link on the Nav Bar.  Users can add artists to their profile manually or link to their Spotify account to import their "Following" artists instantly.

### Adding Venues
Navigate to the "Venues" page via the link on the Nav Bar.  Users can search venues via zipcode or the venues name.  After selecting their desired venue it will be imported into the database along with other information provided by Jambase including address, latitude & longitude, and local website.

### Adding Shows
After a user has added an artist and a venue to their profile, they can now add shows via the "Add a new show" on the dashboard.  Select the artist, venue, and date to create a new show.  After the show has been created, the user will now be redirected to the dashboard and should see their show displayed on the google map, as well as a list of their shows on the side of the page.

## Ideas for future improvement
- User interaction -- Two users who have been to the same show should be able to see each other's profile.
- Show Page -- Create a page for each individual show with the abilities add comments and photos/ interact with other users.
- Email Password Recovery -- If the user forgets their password, a password reset link should be emailed to them.
- Event Suggestions -- Upcoming events should be suggested to the user based on their location and/or artist and venues.

## Database Schema
<img src='https://i.imgur.com/XhcQ4SL.jpg'>
