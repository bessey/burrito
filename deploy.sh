#!/bin/sh
set -e
mix edeliver build release production
mix edeliver deploy release to production
