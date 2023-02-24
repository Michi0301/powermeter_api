# Readme

- Install RVM -> rvm.io
- Docs: https://guides.rubyonrails.org/

## Install Ruby 3.2.1
```
rvm install 3.2.1
```

## Clone Repo & install
```
git clone
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

More to come...
