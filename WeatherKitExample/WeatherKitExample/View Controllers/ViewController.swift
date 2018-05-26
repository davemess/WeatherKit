//
//  ViewController.swift
//  WeatherKitExample
//
//  Created by David Messing on 5/26/18.
//  Copyright © 2018 davemess. All rights reserved.
//

import UIKit
import WeatherKit
import CoreLocation

class ViewController: UIViewController {

    let weatherKit = WeatherKit(apiKey: Keys.appId)
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWeatherAtLocation()
        getWeatherForCity()
        getWeatherAtZip()
        getWeatherByCityId()
    }
    
    // MARK: - data
    
    private func getWeatherAtLocation() {
        let location = CLLocationCoordinate2D(latitude: 30.275755, longitude: -97.739607)
        weatherKit.getCurrentWeather(at: location, success: { (weather) in
            if let temp = weather.temperature {
                let formatter = MeasurementFormatter()
                let formatted = formatter.string(from: temp)
                print(formatted)
            }
        }) { (error) in
            print(error)
        }
    }
    
    private func getWeatherForCity() {
        weatherKit.getCurrentWeather(for: "Austin", success: { (weather) in
            if let temp = weather.temperature {
                let formatter = MeasurementFormatter()
                let formatted = formatter.string(from: temp)
                print(formatted)
            }
        }) { (error) in
            print(error)
        }
    }
    
    private func getWeatherAtZip() {
        weatherKit.getCurrentWeather(for: 78750, success: { (weather) in
            if let temp = weather.temperature {
                let formatter = MeasurementFormatter()
                let formatted = formatter.string(from: temp)
                print(formatted)
            }
        }) { (error) in
            print(error)
        }
    }
    
    private func getWeatherByCityId() {
        weatherKit.getCurrentWeather(by: "4671654", success: { (weather) in
            if let temp = weather.temperature {
                let formatter = MeasurementFormatter()
                let formatted = formatter.string(from: temp)
                print(formatted)
            }
        }) { (error) in
            print(error)
        }
    }
    
}

