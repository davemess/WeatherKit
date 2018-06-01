//
//  OpenWeatherMapService.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// An internal class for interacting with the OpenWeatherMap API.
class OpenWeatherMapService {

    private let urlRequestBuilder: OpenWeatherMapServiceURLRequestBuilder
    private let urlSession: URLSession

    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }()

    // MARK: - lifecycle

    init(urlRequestBuilder: OpenWeatherMapServiceURLRequestBuilder,
         urlSession: URLSession = URLSession(configuration: .default)) {
        self.urlRequestBuilder = urlRequestBuilder
        self.urlSession = urlSession
    }

    // MARK: - internal

    func perform(operation: OpenWeatherMapOperation, completion: @escaping (OpenWeatherMapResponse?, Error?) -> Void) {
        guard let request = urlRequestBuilder.build(for: operation) else {
            completion(nil, WeatherKitError.malformedUrl)
            return
        }

        let task = urlSession.dataTask(with: request) { (data, response, error) in
            // TODO: Check http response codes
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    let response = try self.decoder.decode(OpenWeatherMapResponse.self, from: data)
                    completion(response, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}
