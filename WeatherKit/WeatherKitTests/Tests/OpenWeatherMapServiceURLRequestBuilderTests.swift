//
//  OpenWeatherMapServiceURLRequestBuilderTests.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/1/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import XCTest
@testable import WeatherKit

class OpenWeatherMapServiceURLRequestBuilderTests: XCTestCase {
    
    func testReturnsNilRequestIfUrlBuilderReturnsNilUrl() {
        let urlBuilder = MockOpenWeatherMapServiceURLBuilder(url: nil)
        let requestBuilder = OpenWeatherMapServiceURLRequestBuilderImpl(urlBuilder: urlBuilder)
        
        let operation = OpenWeatherMapOperation.getCurrentByCityId(id: "Austin")
        let request = requestBuilder.build(for: operation)
        XCTAssertNil(request)
    }
    
    func testReturnsNonNilRequestIfUrlBuilderReturnsNonNilUrl() {
        let url = URL(string: "https://openweathermap.org")!
        let urlBuilder = MockOpenWeatherMapServiceURLBuilder(url: url)
        let requestBuilder = OpenWeatherMapServiceURLRequestBuilderImpl(urlBuilder: urlBuilder)
        
        let operation = OpenWeatherMapOperation.getCurrentByCityId(id: "Austin")
        let request = requestBuilder.build(for: operation)
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url, url)
    }
    
}
