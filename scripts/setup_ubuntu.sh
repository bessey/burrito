#!/bin/sh
set -e

# Elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

# Node / Yarn
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# Postgres
sudo apt-get install postgresql postgresql-contrib

# PG setup
sudo -u postgres createuser web -P
# web
sudo -u postgres createdb web
sudo -u postgres createdb burrito_prod

# Deploy setup
sudo mkdir /home/web/.ssh/
sudo cp /home/matt/authorized_keys /home/web/.ssh/
sudo chown -R web:web /home/web/.ssh/

