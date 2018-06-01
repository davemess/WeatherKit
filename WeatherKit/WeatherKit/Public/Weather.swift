//
//  Weather.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
import CoreLocation

/// A summary of weather conditions.
public struct Weather {

    /// The location of the weather condition.
    public let location: CLLocationCoordinate2D?

    /// Current temperature
    public let temperature: Measurement<UnitTemperature>?

    /// Current pressure
    public let pressure: Measurement<UnitPressure>?

    /// Current humidity
    public let humidity: Double?

    /// Current wind speed
    public let windSpeed: Measurement<UnitSpeed>?

    /// Current wind direction
    public let windDirection: Double?

    /// Current cloudiness percentage
    public let cloudiness: Double?

    /// Rain volume for last 3 hours
    public let rainfall: Measurement<UnitLength>?

    /// Snow volume for last 3 hours
    public let snowfall: Measurement<UnitLength>?
}
