//
//  OpenWeatherMapResponseTests.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/2/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherKit

class OpenWeatherMapResponseTests: XCTestCase {
    
    func testDecodesFromJson() {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "success_resp", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let resp = try! decoder.decode(OpenWeatherMapResponse.self, from: data)
        
        XCTAssertNotNil(resp)
        
        XCTAssertEqual(resp.coord?.lat, -16.92)
        XCTAssertEqual(resp.coord?.lon, 145.77)
        
        XCTAssertEqual(resp.weather?[0].id, 803)
        XCTAssertEqual(resp.weather?[0].main, "Clouds")
        XCTAssertEqual(resp.weather?[0].description, "broken clouds")
        XCTAssertEqual(resp.weather?[0].icon, "04n")
        
        XCTAssertEqual(resp.base, "cmc stations")
        
        XCTAssertEqual(resp.main?.temp, 293.25)
        XCTAssertEqual(resp.main?.pressure, 1019)
        XCTAssertEqual(resp.main?.humidity, 83)
        XCTAssertEqual(resp.main?.tempMin, 289.82)
        XCTAssertEqual(resp.main?.tempMax, 295.37)
        
        XCTAssertEqual(resp.wind?.speed, 5.1)
        XCTAssertEqual(resp.wind?.deg, 150)
        
        XCTAssertEqual(resp.clouds?.all, 75)
        
        XCTAssertEqual(resp.rain?.threeHour, 3)
        
        XCTAssertNil(resp.snow)
        
        XCTAssertEqual(resp.dt, Date(timeIntervalSince1970: 1435658272))
        
        XCTAssertEqual(resp.sys?.type, 1)
        XCTAssertEqual(resp.sys?.id, 8166)
        XCTAssertEqual(resp.sys?.message, 0.0166)
        XCTAssertEqual(resp.sys?.country, "AU")
        XCTAssertEqual(resp.sys?.sunrise, Date(timeIntervalSince1970: 1435610796))
        XCTAssertEqual(resp.sys?.sunset, Date(timeIntervalSince1970: 1435650870))
        
        XCTAssertEqual(resp.id, 2172797)
        XCTAssertEqual(resp.name, "Cairns")
        XCTAssertEqual(resp.cod, 200)
    }
    
}
