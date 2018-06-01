//
//  OpenWeatherMapServiceURLBuilder.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// Constructs a url from an OpenWeatherMapOperation.
class OpenWeatherMapServiceURLBuilder {

    private struct Constants {
        static let host = "api.openweathermap.org/data"
        static let version = "2.5"
        static let resource = "weather"

        struct QueryStringKey {
            static let q = "q"
            static let lat = "lat"
            static let lon = "lon"
            static let id = "id"
            static let zip = "zip"
            static let appIdKey = "APPID"
        }
    }

    private let appId: String

    // MARK: - lifecycle

    init(_ appId: String) {
        self.appId = appId
    }

    // MARK: - internal

    func build(for operation: OpenWeatherMapOperation) -> URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.path = String(format: "%@/%@/%@", Constants.host, Constants.version, Constants.resource)
        components.queryItems = buildQueryItems(for: operation)

        return components.url
    }

    // MARK: - private

    private func buildQueryItems(for operation: OpenWeatherMapOperation) -> [URLQueryItem] {
        switch operation {

        case .getCurrentByCityName(let city, let countryCode):
            let value: String
            if let countryCode = countryCode {
                value = String(format: "%@,%@", city, countryCode)
            } else {
                value = city
            }

            return [
                URLQueryItem(name: Constants.QueryStringKey.q, value: value),
                URLQueryItem(name: Constants.QueryStringKey.appIdKey, value: appId)
            ]

        case .getCurrentByCityId(let id):
            return [
                URLQueryItem(name: Constants.QueryStringKey.id, value: id),
                URLQueryItem(name: Constants.QueryStringKey.appIdKey, value: appId)
            ]

        case .getCurrentByGeographic(let lat, let lon):
            return [
                URLQueryItem(name: Constants.QueryStringKey.lat, value: lat.description),
                URLQueryItem(name: Constants.QueryStringKey.lon, value: lon.description),
                URLQueryItem(name: Constants.QueryStringKey.appIdKey, value: appId)
            ]

        case .getCurrentByZip(let zip, let countryCode):
            let value: String
            if let countryCode = countryCode {
                value = String(format: "%@,%@", zip.description, countryCode)
            } else {
                value = zip.description
            }

            return [
                URLQueryItem(name: Constants.QueryStringKey.zip, value: value),
                URLQueryItem(name: Constants.QueryStringKey.appIdKey, value: appId)
            ]
        }
    }
}
