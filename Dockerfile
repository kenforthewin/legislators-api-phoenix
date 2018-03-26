FROM elixir:latest

RUN apt-get update && apt-get install -qq -y inotify-tools --fix-missing --no-install-recommends

RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
COPY ./ ./

ENTRYPOINT [ "./docker-entrypoint.sh" ]
