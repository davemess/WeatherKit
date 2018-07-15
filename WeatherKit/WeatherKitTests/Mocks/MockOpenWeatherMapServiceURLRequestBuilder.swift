//
//  MockOpenWeatherMapServiceURLRequestBuilder.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/2/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
@testable import WeatherKit

class MockOpenWeatherMapServiceURLRequestBuilder: OpenWeatherMapServiceURLRequestBuilder {

    private let request: URLRequest?
    
    init(request: URLRequest?) {
        self.request = request
    }

    func build(for operation: OpenWeatherMapOperation) -> URLRequest? {
        return request
    }
}
