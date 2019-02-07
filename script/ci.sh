#!/bin/bash

set -ex

rake db:create RACK_ENV=test
rake db:setup RACK_ENV=test
rake db:migrate RACK_ENV=test

bundle exec rake