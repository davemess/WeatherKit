//
//  MockURLSessionTaskPerformerImpl.swift
//  WeatherKitTests
//
//  Created by David Messing on 7/15/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
@testable import WeatherKit

// An internal class for performing URLRequests.
class MockURLSessionTaskPerformer: URLSessionTaskPerformer {
    
    private let data: Data?
    private let urlResponse: URLResponse?
    private let error: Error?
    
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.error = error
    }
    
    func perform(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(data, urlResponse, error)
    }
}
