#!/bin/bash -ex

mix edeliver build release --verbose
mix edeliver deploy release to production --verbose
mix edeliver start production --verbose
mix edeliver migrate production --verbose
