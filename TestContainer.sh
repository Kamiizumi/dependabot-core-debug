#!/bin/bash

# Restore ruby deps
cd /src/dependabot-core
bundle install --path vendor/bundle

# Restore deps for each package manager
cd helpers/yarn && yarn install && cd /src/dependabot-core
cd helpers/npm && yarn install && cd /src/dependabot-core
cd helpers/gradle/buildfile_parser && gradle jar && mv build/libs/buildfile_parser.jar ../ && cd /src/dependabot-core
cd helpers/gradle/settings_file_parser && gradle jar && mv build/libs/settings_file_parser.jar ../ && cd /src/dependabot-core
cd helpers/php && composer install && cd /src/dependabot-core
cd helpers/python && pyenv exec pip install -r requirements.txt && pyenv local 2.7.15 && pyenv exec pip install -r requirements.txt && pyenv local --unset && cd /src/dependabot-core
cd helpers/elixir && mix deps.get && cd /src/dependabot-core

# Run dependabot tests
cd helpers/yarn && node_modules/.bin/jest && cd /src/dependabot-core
cd helpers/npm && node_modules/.bin/jest && cd /src/dependabot-core
bundle exec rspec spec
