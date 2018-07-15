//
//  OpenWeatherMapOperationTests.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/1/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherKit

class OpenWeatherMapOperationTests: XCTestCase {

    func testInitWithCoordinateInitsGeographic() {
        let lat = 30.275755
        let long = -97.739607
        let coord = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let operation = OpenWeatherMapOperation(locationCoordinate: coord)

        if case .getCurrentByGeographic(let cLat, let cLong) = operation {
            XCTAssertEqual(lat, cLat)
            XCTAssertEqual(long, cLong)
        } else {
            XCTFail("Did not instantiate the correct enum case.")
        }
    }

}
