#!/usr/bin/env bash
set -e

mix deps.get
# mix deps.compile --include-children --force
mix ecto.create
mix ecto.migrate

exec mix phx.server