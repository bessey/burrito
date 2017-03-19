# Elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir

# Postgres
sudo apt-get install postgresql postgresql-contrib

# PG setup
sudo -u postgres createuser --interactive
# postgres
# y

sudo -u postgres createdb burrito_web_prod
