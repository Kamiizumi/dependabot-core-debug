#!/bin/bash

# Ensures that dependabot-core can be successfully built and tested.
# This script is based on dependabot-core's CI script (.circleci/config.yml in the root of the dependabot-core repository).

# Restore ruby deps
cd /src/dependabot-core
bundle install --path vendor/bundle

# Restore deps for each package manager
cd helpers/yarn && yarn install && cd /src/dependabot-core
cd helpers/npm && yarn install && cd /src/dependabot-core
cd helpers/php && composer install && cd /src/dependabot-core
cd helpers/python && pyenv exec pip install -r requirements.txt && pyenv local 2.7.15 && pyenv exec pip install -r requirements.txt && pyenv local --unset && cd /src/dependabot-core
cd helpers/elixir && mix deps.get && cd /src/dependabot-core
cd helpers/go && make && cd /src/dependabot-core

# Run dependabot tests
cd helpers/yarn && node_modules/.bin/jest && cd /src/dependabot-core
cd helpers/npm && node_modules/.bin/jest && cd /src/dependabot-core

# Ruby tests are disabled because a prompt appears during CI asking for GitHub
# credentials during the test "given a gem with a private github source".
# TODO: Enable Ruby tests when a fix for the above issue has been found.
#bundle exec rspec spec --format documentation --format RspecJunitFormatter -o ~/rspec/rspec.xml --tag "~skip_ci"
