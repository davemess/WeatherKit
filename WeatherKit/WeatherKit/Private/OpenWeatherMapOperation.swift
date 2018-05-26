//
//  OpenWeatherMapOperation.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
import CoreLocation

/// Provides a mapping to OpenWeatherMap API operations.
enum OpenWeatherMapOperation {
    case getCurrentByCityName(city: String, countryCode: String?)
    case getCurrentByCityId(id: String)
    case getCurrentByGeographic(lat: Double, lon: Double)
    case getCurrentByZip(zip: Int, countryCode: String?)
}

extension OpenWeatherMapOperation {
    
    init(locationCoordinate: CLLocationCoordinate2D) {
        self = .getCurrentByGeographic(lat: locationCoordinate.latitude, lon: locationCoordinate.longitude)
    }
}
