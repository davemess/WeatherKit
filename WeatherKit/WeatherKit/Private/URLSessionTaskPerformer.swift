//
//  URLSessionTaskPerformer.swift
//  WeatherKit
//
//  Created by David Messing on 7/15/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// Defines a protocol for making URLRequests.
protocol DataTaskProvider {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

/// Default conformance of DataTaskProvider.
extension URLSession: DataTaskProvider {}

/// Defines a protocol for performing URLRequests.
protocol URLSessionTaskPerformer {
    func perform(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

/// An internal class for performing URLRequests.
class URLSessionTaskPerformerImpl: URLSessionTaskPerformer {
    
    private let dataTaskProvider: DataTaskProvider
    
    // MARK: - lifecycle
    
    init(_ dataTaskProvider: DataTaskProvider = URLSession(configuration: .default)) {
        self.dataTaskProvider = dataTaskProvider
    }
    
    // MARK: - URLSessionTaskPerformer
    
    func perform(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTaskProvider.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
}
