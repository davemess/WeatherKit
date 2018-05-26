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
    public let location: CLLocationCoordinate2D?
    public let temperature: Measurement<UnitTemperature>?
    public let pressure: Measurement<UnitPressure>?
    public let humidity: Double?
    public let windSpeed: Measurement<UnitSpeed>?
    public let windDirection: Double?
    public let cloudiness: Double?
    public let rainfall: Measurement<UnitLength>?
    public let snowfall: Measurement<UnitLength>?
}
