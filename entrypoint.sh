#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /spellbook-api2/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

# rm -f tmp/pids/server.pid
# bin/rails server -b 0.0.0.0 -p $PORT
