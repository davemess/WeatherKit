//
//  WeatherTests.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/23/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherKit

class WeatherTests: XCTestCase {
    
    func testInitFromOpenWeatherMapResponse() {
        let coord = OpenWeatherMapResponse.Coord(lon: -97.739607, lat: 30.275755)
        let main = OpenWeatherMapResponse.Main(temp: 289.5, pressure: 1013, humidity: 89, tempMin: 287.04, tempMax: 292.04, seaLevel: 0, grndLevel: 0)
        let wind = OpenWeatherMapResponse.Wind(speed: 7.31, deg: 187.002)
        let clouds = OpenWeatherMapResponse.Clouds(all: 92)
        let rain = OpenWeatherMapResponse.Rain(threeHour: 0.25)
        let snow = OpenWeatherMapResponse.Snow(threeHour: 0.33)
        let response = OpenWeatherMapResponse(coord: coord, weather: nil, base: nil, main: main, wind: wind, clouds: clouds, rain: rain, snow: snow, dt: nil, sys: nil, id: nil, name: nil, cod: nil)
        let weather = Weather(response: response)
        
        XCTAssertNotNil(weather.location)
        XCTAssertEqual(weather.location!.latitude, 30.275755)
        XCTAssertEqual(weather.location!.longitude, -97.739607)
        
        XCTAssertNotNil(weather.temperature)
        XCTAssertEqual(weather.temperature!, Measurement(value: 289.5, unit: UnitTemperature.kelvin))
        
        XCTAssertNotNil(weather.pressure)
        XCTAssertEqual(weather.pressure!, Measurement(value: 1013, unit: UnitPressure.hectopascals))
        
        XCTAssertNotNil(weather.humidity)
        XCTAssertEqual(weather.humidity!, 89.0)
        
        XCTAssertNotNil(weather.windSpeed)
        XCTAssertEqual(weather.windSpeed!, Measurement(value: 7.31, unit: UnitSpeed.metersPerSecond))
        
        XCTAssertNotNil(weather.windDirection)
        XCTAssertEqual(weather.windDirection!, 187.002)
        
        XCTAssertNotNil(weather.cloudiness)
        XCTAssertEqual(weather.cloudiness!, 92)
        
        XCTAssertNotNil(weather.rainfall)
        XCTAssertEqual(weather.rainfall!, Measurement(value: 0.25, unit: UnitLength.millimeters))
        
        XCTAssertNotNil(weather.snowfall)
        XCTAssertEqual(weather.snowfall!, Measurement(value: 0.33, unit: UnitLength.millimeters))
    }
    
}
