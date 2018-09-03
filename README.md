![Swift](http://img.shields.io/badge/swift-4.1-brightgreen.svg)
[![Build Status](https://travis-ci.org/davemess/WeatherKit.svg?branch=feature%2Ftesting)](https://travis-ci.org/davemess/WeatherKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/WeatherKit.svg?style=flat)](https://github.com/davemess/WeatherKit)
[![Platform](https://img.shields.io/cocoapods/p/WeatherKit.svg?style=flat)](https://github.com/davemess/WeatherKit)

# WeatherKit
A simple Swift library for accessing weather data in your app. WeatherKit is based on the [OpenWeatherMap API](https://openweathermap.org/).

Features include getting location-based current weather conditions based on:

- City name
- City ID Code
- Lat/lon coordinates
- Zip code
---

## Installation

Recommended to use [Carthage](https://github.com/Carthage/Carthage).

- Add `github.com/davemess/WeatherKit.git` to your Cartfile
- Perform a `carthage update`
- Embed the built product in your app's embedded frameworks.

---

## Usage

1. Initialize your WeatherKit instance:

  ```let weatherKit = WeatherKit(apiKey: <#API_KEY#>)```

2. Request weather at a location:

  ```
  let coordinate: CLLocationCoordinate2D = // access the user's current location
  weatherKit.getCurrentWeather(at: coordinate, success: { (weather) in
        // do something with `weather`
      }) { (error) in
        // handle error
      }
  ```

3. Use properties of the `Weather` struct, including temperature, humidity, rainfail, etc.  

---

## TODO
_Admin_
- [x] Document public interface
- [x] Update readme with usage
- [x] Versioning

_Project_
- [x] Unit Testing
- [x] Swift Lint
- [x] Docs
- [x] Badges

_Features_
- [x] Add Current Weather
- [ ] Check HTTP status code
- [ ] Add Forecast
- [ ] Configure timeout/urlsession
- [ ] Add Operations/Operation Queue
- [ ] Update for Xcode 10
