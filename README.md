# Readme

- Install RVM -> rvm.io

## Install Ruby 3.2.1
```
rvm install 3.2.1
```

## Clone Repo & install
```
git clone https://github.com/Michi0301/powermeter_api.git
cd powermeter_api
bundle install
```

# Start server
```
rails s -p 3000
```

## Test the api
```
curl localhost:3000/dashboards
```

```
=> {"current_power":123.0,"status":"CHARGING"}
```

## Configuration options
Canfiguration via ENV.

- EVCC_API, default: "http://localhost:7070/api"
