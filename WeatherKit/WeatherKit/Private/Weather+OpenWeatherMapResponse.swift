//
//  Weather+OpenWeatherMapResponse.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
import CoreLocation

extension Weather {
    
    init(response: OpenWeatherMapResponse) {
        var location: CLLocationCoordinate2D? = nil
        var temperature: Measurement<UnitTemperature>? = nil
        var pressure: Measurement<UnitPressure>? = nil
        var humidity: Double? = nil
        var windSpeed: Measurement<UnitSpeed>? = nil
        var windDirection: Double? = nil
        var cloudiness: Double? = nil
        var rainfall: Measurement<UnitLength>? = nil
        var snowfall: Measurement<UnitLength>? = nil
        
        if let coords = response.coord {
            location = CLLocationCoordinate2D(latitude: coords.lat, longitude: coords.lon)
        }
        
        if let temp = response.main?.temp {
            temperature = Measurement(value: temp, unit: UnitTemperature.kelvin)
        }
        
        if let pres = response.main?.pressure {
            pressure = Measurement(value: pres, unit: UnitPressure.hectopascals)
        }
        
        humidity = response.main?.humidity
        
        if let speed = response.wind?.speed {
            windSpeed = Measurement(value: speed, unit: UnitSpeed.metersPerSecond)
        }
        
        windDirection = response.wind?.deg
        cloudiness = response.clouds?.all
        
        if let rain = response.rain?.threeHour {
            rainfall = Measurement(value: rain, unit: UnitLength.millimeters)
        }
        
        if let snow = response.snow?.threeHour {
            snowfall = Measurement(value: snow, unit: UnitLength.millimeters)
        }
        
        self = Weather(location: location,
                       temperature: temperature,
                       pressure: pressure,
                       humidity: humidity,
                       windSpeed: windSpeed,
                       windDirection: windDirection,
                       cloudiness: cloudiness,
                       rainfall: rainfall,
                       snowfall: snowfall)
    }
}
