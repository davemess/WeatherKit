//
//  MockOpenWeatherMapServiceURLBuilder.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/2/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
@testable import WeatherKit

class MockOpenWeatherMapServiceURLBuilder: OpenWeatherMapServiceURLBuilder {
    
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    func build(for operation: OpenWeatherMapOperation) -> URL? {
        return url
    }
}
