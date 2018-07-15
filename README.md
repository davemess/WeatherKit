![Swift](http://img.shields.io/badge/swift-4.1-brightgreen.svg)
[![Build Status](https://travis-ci.org/davemess/WeatherKit.svg?branch=feature%2Ftesting)](https://travis-ci.org/davemess/WeatherKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/WeatherKit.svg?style=flat)](https://github.com/davemess/WeatherKit)
[![Platform](https://img.shields.io/cocoapods/p/WeatherKit.svg?style=flat)](https://github.com/davemess/WeatherKit)

# WeatherKit
A simple Swift library for accessing weather data in your app.

---

## Usage

1. Initialize your WeatherKit instance:

  ```let weatherKit = WeatherKit(apiKey: <#API_KEY#>)```

2. Request weather at a location:

  ```
  weatherKit.getWeather(at: coordinate, success: { (weather) in
        // do something with `weather`
      }) { (error) in
        // handle error
      }
  ```

---

## TODO
_Admin_
- [x] Document public interface
- [ ] Update readme with usage
- [ ] Versioning

_Project_
- [ ] Unit Testing
- [x] Swift Lint
- [x] Docs
- [x] Badges

_Features_
- [x] Add Current Weather
- [ ] Check HTTP status code
- [ ] Add Forecast
- [ ] Configure timeout/urlsession
- [ ] Add Operations/Operation Queue
