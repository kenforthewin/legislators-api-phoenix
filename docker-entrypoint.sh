#!/usr/bin/env bash
set -e

mix deps.get
mix compile --force
mix ecto.create
mix ecto.migrate

exec mix phx.server
