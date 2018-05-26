//
//  OpenWeatherMapResponse.swift
//  WeatherKit
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import Foundation

/// Maps the raw response from the OpenWeatherMap API call.
struct OpenWeatherMapResponse: Decodable {
    
    struct Coord: Decodable {
        let lon: Double
        let lat: Double
    }
    
    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Main: Decodable {
        let temp: Double?
        let pressure: Double?
        let humidity: Double?
        let tempMin: Double?
        let tempMax: Double?
        let seaLevel: Double?
        let grndLevel: Double?
    }
    
    struct Wind: Decodable {
        let speed: Double?
        let deg: Double?
    }
    
    struct Clouds: Decodable {
        let all: Double?
    }
    
    struct Rain: Decodable {
        enum CodingKeys: String, CodingKey {
            case threeHour = "3h"
        }
        
        let threeHour: Double?
    }
    
    struct Snow: Decodable {
        enum CodingKeys: String, CodingKey {
            case threeHour = "3h"
        }
        
        let threeHour: Double?
    }
    
    struct Sys: Decodable {
        let type: Int?
        let id: Int?
        let message: Double?
        let country: String?
        let sunrise: Date?
        let sunset: Date?
    }
    
    // MARK: - properties
    
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let wind: Wind?
    let clouds: Clouds?
    let rain: Rain?
    let snow: Snow?
    let dt: Date?
    let sys: Sys?
    let id: Int?
    let name: String?
    let cod: Int?
}
