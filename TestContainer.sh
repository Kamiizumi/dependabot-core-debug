#!/bin/bash

cd /dependabot-core

bundle install --path vendor/bundle
cd helpers/yarn && yarn install && cd ~/dependabot-core
cd helpers/npm && yarn install && cd ~/dependabot-core
cd helpers/gradle/buildfile_parser && gradle jar && mv build/libs/buildfile_parser.jar ../ && cd ~/dependabot-core
cd helpers/gradle/settings_file_parser && gradle jar && mv build/libs/settings_file_parser.jar ../ && cd ~/dependabot-core
cd helpers/php && composer install && cd ~/dependabot-core
cd helpers/python && pyenv exec pip install -r requirements.txt && pyenv local 2.7.15 && pyenv exec pip install -r requirements.txt && pyenv local --unset && cd ~/dependabot-core
cd helpers/elixir && mix deps.get && cd ~/dependabot-core
