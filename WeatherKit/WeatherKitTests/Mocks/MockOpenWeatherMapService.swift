//
//  MockOpenWeatherMapService.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/23/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
@testable import WeatherKit

class MockOpenWeatherMapService: OpenWeatherMapService {
    
    let response: OpenWeatherMapResponse?
    let error: Error?
    
    init(response: OpenWeatherMapResponse?, error: Error?) {
        self.response = response
        self.error = error
    }
    
    func perform(operation: OpenWeatherMapOperation, completion: @escaping (OpenWeatherMapResponse?, Error?) -> Void) {
        completion(response, error)
    }
}
