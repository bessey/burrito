#!/bin/bash -ex

BRANCH=${1:-master};

mix edeliver build release --branch=BRANCH --verbose
mix edeliver deploy release to production --verbose
mix edeliver start production --verbose
mix edeliver migrate production up --verbose
