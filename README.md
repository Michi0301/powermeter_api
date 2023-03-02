# Readme

- Install RVM -> rvm.io

## Install Ruby 3.2.1
```
rvm install 3.2.1
```

## Clone Repo & Install
```
git clone https://github.com/Michi0301/powermeter_api.git
cd powermeter_api
bundle install
```

## Run Tests
```
rspec spec
```

## Start Server
```
rails s -p 3000
```

## Test The Api
```
curl localhost:3000/dashboards
```

## Configuration Options
Canfiguration via ENV.

- `EVCC_API`, default: `http://localhost:7070/api`

## Json API
Request: `get` /dashboards

Response:
```
}
  "state": "SUCCESS",
  "values": {
  "battery_power": 1234
}
```

## Docker
### Build Image
```
docker build .
````

### Run in Production Mode
```
docker run -p <host port>:3000 -e RAILS_ENV=production <image id>
```
