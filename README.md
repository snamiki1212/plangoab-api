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
$ brew install postgresql # install
$ createuser --superuser --createrole postgres # create user
$ brew services start postgresql # start
$ brew services list # list
$ brew services stop postgresql # stop
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

  - RSpec / FactoryBot

- Hosting

  - Heroku

- CI/CD

  - GitHub Actions
  - Heroku GitHub Deploys

## LICENSE

© 2021 Shun Namiki aka Nash

Note that this code is not allowed to use as like OSS.
