# Overview

## Installation

```zsh
$ bundle install
$ bundle exec rails db:setup
$ bundle exec rails db:migrate
$ bundle exec rails server
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

## NOTE: Github Actions

```zsh
$ bundle exec rubocop -A
$ bundle exec rspec
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

## LICENSE

⚠️ Note that this code is not available as open source code.
