//
//  WeatherKitTests.swift
//  WeatherKitTests
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import XCTest
import CoreLocation
@testable import WeatherKit

class WeatherKitTests: XCTestCase {
    
    // MARK: - Lifecycle
    
    func testInitWithApiKey() {
        let apiKey = "1234"
        let weatherKit = WeatherKit(apiKey: apiKey)
        XCTAssertNotNil(weatherKit)
    }
    
    // MARK: - City
    
    func testGetWeatherForCityFailsIfOperationFails() {
        let service = MockOpenWeatherMapService(response: nil, error: MockError())
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(for: "Austin", success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForCitySucceedsIfOperationSucceeds() {
        let response = OpenWeatherMapResponse(coord: nil, weather: nil, base: nil, main: nil, wind: nil, clouds: nil, rain: nil, snow: nil, dt: nil, sys: nil, id: nil, name: nil, cod: nil)
        let service = MockOpenWeatherMapService(response: response, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(for: "Austin", success: { (weather) in
            XCTAssertNotNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForCityFailsIfOperationCompletesWithoutResponseOrError() {
        let service = MockOpenWeatherMapService(response: nil, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(for: "Austin", success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    // MARK: - CityId
    
    func testGetWeatherForCityIdFailsIfOperationFails() {
        let service = MockOpenWeatherMapService(response: nil, error: MockError())
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(by: "4254010", success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForCityIdSucceedsIfOperationSucceeds() {
        let response = OpenWeatherMapResponse(coord: nil, weather: nil, base: nil, main: nil, wind: nil, clouds: nil, rain: nil, snow: nil, dt: nil, sys: nil, id: nil, name: nil, cod: nil)
        let service = MockOpenWeatherMapService(response: response, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(by: "4254010", success: { (weather) in
            XCTAssertNotNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForCityIdFailsIfOperationCompletesWithoutResponseOrError() {
        let service = MockOpenWeatherMapService(response: nil, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(by: "4254010", success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    // MARK: - Location
    
    func testGetWeatherForLocationFailsIfOperationFails() {
        let service = MockOpenWeatherMapService(response: nil, error: MockError())
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        let location = CLLocationCoordinate2D(latitude: 30.275755, longitude: -97.739607)
        weatherKit.getCurrentWeather(at: location, success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForLocationSucceedsIfOperationSucceeds() {
        let response = OpenWeatherMapResponse(coord: nil, weather: nil, base: nil, main: nil, wind: nil, clouds: nil, rain: nil, snow: nil, dt: nil, sys: nil, id: nil, name: nil, cod: nil)
        let service = MockOpenWeatherMapService(response: response, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        let location = CLLocationCoordinate2D(latitude: 30.275755, longitude: -97.739607)
        weatherKit.getCurrentWeather(at: location, success: { (weather) in
            XCTAssertNotNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForLocationFailsIfOperationCompletesWithoutResponseOrError() {
        let service = MockOpenWeatherMapService(response: nil, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        let location = CLLocationCoordinate2D(latitude: 30.275755, longitude: -97.739607)
        weatherKit.getCurrentWeather(at: location, success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    // MARK: - Zip
    
    func testGetWeatherForZipFailsIfOperationFails() {
        let service = MockOpenWeatherMapService(response: nil, error: MockError())
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(for: 78750, success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForZipSucceedsIfOperationSucceeds() {
        let response = OpenWeatherMapResponse(coord: nil, weather: nil, base: nil, main: nil, wind: nil, clouds: nil, rain: nil, snow: nil, dt: nil, sys: nil, id: nil, name: nil, cod: nil)
        let service = MockOpenWeatherMapService(response: response, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(for: 78750, success: { (weather) in
            XCTAssertNotNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testGetWeatherForZipFailsIfOperationCompletesWithoutResponseOrError() {
        let service = MockOpenWeatherMapService(response: nil, error: nil)
        let weatherKit = WeatherKit(weatherMapService: service)
        
        let expect = XCTestExpectation(description: "")
        weatherKit.getCurrentWeather(for: 78750, success: { (weather) in
            XCTAssertNil(weather)
            assertMainThread()
            expect.fulfill()
        }) { (error) in
            XCTAssertNotNil(error)
            assertMainThread()
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
}

func assertMainThread() {
    XCTAssertTrue(Thread.current.isMainThread)
}
