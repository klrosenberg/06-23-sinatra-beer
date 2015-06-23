# Beer Inventory Application

## Description

This web application will include the following:
- Table of breweries
- Table of beer types
- Table of users
- Table of beers, each with an id, name, abv and average rating
- Table of likes, each with an id, user id, beer id and rating

Each beer is categorized by a specific beer type and a specific brewery. Many beers share the same beer type and/or the same brewery.

## Should Cases

- Add new beers
- Read through beer list
- Add new brewery
- Add new beer type
- Search through beers by brewery
- Search through beers by beer type
- Search through beers by abv
- Search through beers by rating
- Search users beer 'history'


## Should Not Cases

- Add a beer that already exists
- Add a beer without filling in all field values
- Assign a beer to multiple beer types or breweries

## Requirements

- At least three models
    - At least one one-to-many relationship
    - At least one many-to-many relationship
- Unit tests for all business logic
- Ability to fully interact with the application from the browser
