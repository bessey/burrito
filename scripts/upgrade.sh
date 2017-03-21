#!/bin/bash -ex

mix edeliver build upgrade --verbose
mix edeliver upgrade production --verbose
mix edeliver migrate production --verbose
