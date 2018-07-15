//
//  WeatherKit.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation
import CoreLocation

/// Summary of potential errors.
///
/// - malformedUrl: indicates a url could not be constructed
/// - httpError: contains the HTTP status code
/// - unknown: an unknown error
public enum WeatherKitError: Error {
    case malformedUrl
    case httpError(code: Int)
    case unknown
}

/// A closure which contains a Weather object.
public typealias WeatherKitSuccess = (Weather) -> Void

/// An error closure which contains an error.
public typealias WeatherKitFailure = (Error) -> Void

/// Entrypoint to the WeatherKit SDK.
public class WeatherKit {

    private let weatherMapService: OpenWeatherMapService

    // MARK: - lifecycle

    /// Designated initializer.
    ///
    /// - Parameter apiKey: an API Key assigned by OpenWeatherMap. See
    /// https://openweathermap.org/appid
    public convenience init(apiKey: String) {
        let urlBuilder = OpenWeatherMapServiceURLBuilderImpl(apiKey)
        let urlRequestBuilder = OpenWeatherMapServiceURLRequestBuilderImpl(urlBuilder: urlBuilder)
        let urlSessionTaskPerformer = URLSessionTaskPerformerImpl()
        let weatherMapService = OpenWeatherMapServiceImpl(urlRequestBuilder: urlRequestBuilder, urlSessionTaskPerformer: urlSessionTaskPerformer)
        self.init(weatherMapService: weatherMapService)
    }

    /// Internal for unit testing access.
    init(weatherMapService: OpenWeatherMapService) {
        self.weatherMapService = weatherMapService
    }

    // MARK: - Current Weather

    /// Gets current weather for the specified city.
    ///
    /// - Parameters:
    ///   - city: the city to search.
    ///   - country: an optional country code.
    ///   - success: a success closure to run on completion.
    ///   - failure: a failure closure to run on completion
    public func getCurrentWeather(for city: String, country: String? = nil, success: @escaping WeatherKitSuccess, failure: @escaping WeatherKitFailure) {
        let operation: OpenWeatherMapOperation = .getCurrentByCityName(city: city, countryCode: country)
        perform(operation: operation, success: success, failure: failure)
    }

    /// Gets current weather for the specified city ID.
    ///
    /// - Parameters:
    ///   - cityId: the city ID to search.
    ///   - success: a success closure to run on completion.
    ///   - failure: a failure closure to run on completion
    public func getCurrentWeather(by cityId: String, success: @escaping WeatherKitSuccess, failure: @escaping WeatherKitFailure) {
        let operation: OpenWeatherMapOperation = .getCurrentByCityId(id: cityId)
        perform(operation: operation, success: success, failure: failure)
    }

    /// Gets current weather at the specified location coordinate.
    ///
    /// - Parameters:
    ///   - location: the location coordinate to search.
    ///   - success: a success closure to run on completion.
    ///   - failure: a failure closure to run on completion
    public func getCurrentWeather(at location: CLLocationCoordinate2D, success: @escaping WeatherKitSuccess, failure: @escaping WeatherKitFailure) {
        let operation: OpenWeatherMapOperation = OpenWeatherMapOperation(locationCoordinate: location)
        perform(operation: operation, success: success, failure: failure)
    }

    /// Gets current weather for the specified zip code.
    ///
    /// - Parameters:
    ///   - zip: the zip code to search.
    ///   - country: an optional country code.
    ///   - success: a success closure to run on completion.
    ///   - failure: a failure closure to run on completion
    public func getCurrentWeather(for zip: Int, country: String? = nil, success: @escaping WeatherKitSuccess, failure: @escaping WeatherKitFailure) {
        let operation: OpenWeatherMapOperation = .getCurrentByZip(zip: zip, countryCode: country)
        perform(operation: operation, success: success, failure: failure)
    }

    // MARK: - private

    private func perform(operation: OpenWeatherMapOperation, success: @escaping WeatherKitSuccess, failure: @escaping WeatherKitFailure) {
        weatherMapService.perform(operation: operation) { (response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    failure(error)
                } else if let response = response {
                    let result = Weather(response: response)
                    success(result)
                } else {
                    failure(WeatherKitError.unknown)
                }
            }
        }
    }
}
