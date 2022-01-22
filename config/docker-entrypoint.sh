#!/bin/sh
# Exit on fail
set -e

unset BUNDLE_PATH
unset BUNDLE_BIN

bundle exec bundle install
bundle exec bundle update

exec "$@"
