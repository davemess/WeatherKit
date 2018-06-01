//
//  OpenWeatherMapServiceURLRequestBuilder.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// Constructs a url request from an OpenWeatherMapOperation.
class OpenWeatherMapServiceURLRequestBuilder {

    private enum HTTPMethod: String {
        case get = "GET"
    }

    private let urlBuilder: OpenWeatherMapServiceURLBuilder

    // MARK: - lifecycle

    init(urlBuilder: OpenWeatherMapServiceURLBuilder) {
        self.urlBuilder = urlBuilder
    }

    // MARK: - internal

    func build(for operation: OpenWeatherMapOperation) -> URLRequest? {
        guard let url = urlBuilder.build(for: operation) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue

        return request
    }
}
