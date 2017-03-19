# Burrito

**TODO: Add description**

## Deployment

### Hot Deployment
```sh
# Build upgrade package (replace VERSION with e.g. 0.1.2)
$ mix edeliver build upgrade --with=VERSION
# Deploy it
$ mix edeliver deploy upgrade to production
```

### Cold Deployment
```sh
# Build it
$ mix edeliver build release production
# Deploy it
$ mix edeliver deploy release to production
# Start it
$ mix edeliver start production
```
