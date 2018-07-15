//
//  OpenWeatherMapServiceURLBuilderTests.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/2/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import XCTest
@testable import WeatherKit

class OpenWeatherMapServiceURLBuilderTests: XCTestCase {
    
    func testBuildsURLWithHttpScheme() {
        let builder = OpenWeatherMapServiceURLBuilderImpl("1234")
        
        let operations: [OpenWeatherMapOperation] = [
            .getCurrentByCityName(city: "Austin", countryCode: nil),
            .getCurrentByCityId(id: "4671654"),
            .getCurrentByGeographic(lat: 30.275755, lon: -97.739607),
            .getCurrentByZip(zip: 78750, countryCode: nil),
            ]
        
        operations.forEach { (operation) in
            let url = builder.build(for: operation)
            XCTAssertNotNil(url)
            XCTAssertEqual(url!.scheme, "http")
        }
    }
    
    func testBuildsURLWithCorrectPath() {
        let builder = OpenWeatherMapServiceURLBuilderImpl("1234")
        
        let operations: [OpenWeatherMapOperation] = [
            .getCurrentByCityName(city: "Austin", countryCode: nil),
            .getCurrentByCityId(id: "4671654"),
            .getCurrentByGeographic(lat: 30.275755, lon: -97.739607),
            .getCurrentByZip(zip: 78750, countryCode: nil),
            ]
        
        operations.forEach { (operation) in
            let url = builder.build(for: operation)
            XCTAssertNotNil(url)
            
            let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
            XCTAssertEqual(components!.path, "api.openweathermap.org/data/2.5/weather")
        }
    }
    
    func testBuildURLWithQueryItemsForCityNameQueryWithoutCountryCode() {
        let appId = "1234"
        let builder = OpenWeatherMapServiceURLBuilderImpl(appId)
        
        let operation: OpenWeatherMapOperation = .getCurrentByCityName(city: "Austin", countryCode: nil)
        
        let url = builder.build(for: operation)
        XCTAssertNotNil(url)
        
        let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(components!.query, "q=Austin&APPID=1234")
    }
    
    func testBuildURLWithQueryItemsForCityNameQueryWithCountryCode() {
        let appId = "1234"
        let builder = OpenWeatherMapServiceURLBuilderImpl(appId)
        
        let operation: OpenWeatherMapOperation = .getCurrentByCityName(city: "Austin", countryCode: "us")
        
        let url = builder.build(for: operation)
        XCTAssertNotNil(url)
        
        let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(components!.query, "q=Austin,us&APPID=1234")
    }
    
    func testBuildURLWithQueryItemsForCityIdQuery() {
        let appId = "1234"
        let builder = OpenWeatherMapServiceURLBuilderImpl(appId)
        
        let operation: OpenWeatherMapOperation = .getCurrentByCityId(id: "4671654")
        
        let url = builder.build(for: operation)
        XCTAssertNotNil(url)
        
        let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(components!.query, "id=4671654&APPID=1234")
    }
    
    func testBuildURLWithQueryItemsForGeographicQuery() {
        let appId = "1234"
        let builder = OpenWeatherMapServiceURLBuilderImpl(appId)
        
        let operation: OpenWeatherMapOperation = .getCurrentByGeographic(lat: 30.275755, lon: -97.739607)
        
        let url = builder.build(for: operation)
        XCTAssertNotNil(url)
        
        let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(components!.query, "lat=30.275755&lon=-97.739607&APPID=1234")
    }
    
    func testBuildURLWithQueryItemsForZipQueryWithoutCountryCode() {
        let appId = "1234"
        let builder = OpenWeatherMapServiceURLBuilderImpl(appId)
        
        let operation: OpenWeatherMapOperation = .getCurrentByZip(zip: 78750, countryCode: nil)
        
        let url = builder.build(for: operation)
        XCTAssertNotNil(url)
        
        let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(components!.query, "zip=78750&APPID=1234")
    }
    
    func testBuildURLWithQueryItemsForZipQueryWithCountryCode() {
        let appId = "1234"
        let builder = OpenWeatherMapServiceURLBuilderImpl(appId)
        
        let operation: OpenWeatherMapOperation = .getCurrentByZip(zip: 78750, countryCode: "us")
        
        let url = builder.build(for: operation)
        XCTAssertNotNil(url)
        
        let components = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        XCTAssertEqual(components!.query, "zip=78750,us&APPID=1234")
    }
}
