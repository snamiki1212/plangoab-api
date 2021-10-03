# Overview

## Installation

```zsh
$ bundle install
$ bundle exec rails db:setup
$ bundle exec rails db:migrate
$ bundle exec rails server --port 3001
```

## Note: DB

```zsh
# install
$ brew install postgresql

# create user
$ createuser --superuser --createrole postgres

# start
$ brew services start postgresql

# list
$ brew services list

# stop
$ brew services stop postgresql
```

## NOTE: Tasks

```zsh
# run test
$ bundle exec rspec

# run lint
$ bundle exec rubocop
$ bundle exec rubocop --auto-correct
```

## Note: Heroku

```zsh
# migrate
heroku run rake db:migrate --app plangoab
```

## Tech Stacks

- Core

  - Rails 6.1.4
  - Ruby 3.0.2

- Pagination

  - Pagy

- Formater / Linter

  - Rubocop

- Test

  - RSpec, FactoryBot

- CI

  - TODO: GithubActions

## LICENSE

⚠️ Note that this code is not available as open source code.

I'm thinking about this license and have not decided yet what I choose.
