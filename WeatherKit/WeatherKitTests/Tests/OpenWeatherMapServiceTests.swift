//
//  OpenWeatherMapServiceTests.swift
//  WeatherKitTests
//
//  Created by David Messing on 6/2/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import XCTest
@testable import WeatherKit

class OpenWeatherMapServiceTests: XCTestCase {
    
    private lazy var urlRequestBuilder: OpenWeatherMapServiceURLRequestBuilder = {
        let url = URL(string: "https://openweathermap.org")!
        let urlRequest = URLRequest(url: url)
        let requestBuilder = MockOpenWeatherMapServiceURLRequestBuilder(request: urlRequest)
        return requestBuilder
    }()

    func testCompletesWithErrorIfCannotBuildUrlRequest() {
        let requestBuilder = MockOpenWeatherMapServiceURLRequestBuilder(request: nil)
        let urlSessionTaskPerformer = MockURLSessionTaskPerformer(data: nil, urlResponse: nil, error: nil)
        let service = OpenWeatherMapServiceImpl(urlRequestBuilder: requestBuilder, urlSessionTaskPerformer: urlSessionTaskPerformer)
        
        let operation = OpenWeatherMapOperation.getCurrentByCityId(id: "Austin")
        let expect = XCTestExpectation(description: "")
        service.perform(operation: operation) { (response, error) in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            expect.fulfill()
        }

        wait(for: [expect], timeout: 1)
    }

    func testCompletesWithErrorIfDataTaskCompletesWithError() {
        let urlSessionTaskPerformer = MockURLSessionTaskPerformer(data: nil, urlResponse: nil, error: MockError())
        let service = OpenWeatherMapServiceImpl(urlRequestBuilder: urlRequestBuilder, urlSessionTaskPerformer: urlSessionTaskPerformer)
        
        let operation = OpenWeatherMapOperation.getCurrentByCityId(id: "Austin")
        let expect = XCTestExpectation(description: "")
        service.perform(operation: operation) { (response, error) in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            expect.fulfill()
        }

        wait(for: [expect], timeout: 1)
    }
    
    func testCompletesWithResponseIfDataTaskCompletesDecodableData() {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "success_resp", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        
        let urlSessionTaskPerformer = MockURLSessionTaskPerformer(data: data, urlResponse: nil, error: nil)
        let service = OpenWeatherMapServiceImpl(urlRequestBuilder: urlRequestBuilder, urlSessionTaskPerformer: urlSessionTaskPerformer)
        
        let operation = OpenWeatherMapOperation.getCurrentByCityId(id: "Austin")
        let expect = XCTestExpectation(description: "")
        service.perform(operation: operation) { (response, error) in
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testCompletesWithErrorIfDataTaskCompletesNondecodableData() {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "error_resp", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        
        let urlSessionTaskPerformer = MockURLSessionTaskPerformer(data: data, urlResponse: nil, error: nil)
        let service = OpenWeatherMapServiceImpl(urlRequestBuilder: urlRequestBuilder, urlSessionTaskPerformer: urlSessionTaskPerformer)
        
        let operation = OpenWeatherMapOperation.getCurrentByCityId(id: "Austin")
        let expect = XCTestExpectation(description: "")
        service.perform(operation: operation) { (response, error) in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
    
    func testCompletesWithNilIfDataTaskCompletesWithoutErrorOrData() {
        let urlSessionTaskPerformer = MockURLSessionTaskPerformer(data: nil, urlResponse: nil, error: nil)
        let service = OpenWeatherMapServiceImpl(urlRequestBuilder: urlRequestBuilder, urlSessionTaskPerformer: urlSessionTaskPerformer)
        
        let operation = OpenWeatherMapOperation.getCurrentByCityId(id: "Austin")
        let expect = XCTestExpectation(description: "")
        service.perform(operation: operation) { (response, error) in
            XCTAssertNil(response)
            XCTAssertNil(error)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 1)
    }
}
