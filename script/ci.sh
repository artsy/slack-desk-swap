#!/bin/bash

set -ex

./script/wait-for-it.sh slack-deskswap-db:5432 -- echo "Database is READY... phew...."
rake db:create RACK_ENV=test
rake db:setup RACK_ENV=test
rake db:migrate RACK_ENV=test

bundle exec rake