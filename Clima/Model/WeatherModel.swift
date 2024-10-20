//
//  WeatherModel.swift
//  Clima
//
//  Created by Vladimir on 14/10/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var getConditionName: String {
        switch conditionID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }

    }
    
    init(conditionID: Int, cityName: String, temperature: Double) {
        self.conditionID = conditionID
        self.cityName = cityName
        self.temperature = temperature
    }
    
    init(weatherData: WeatherData) {
        self.conditionID = weatherData.weather[0].id
        self.cityName = weatherData.name
        self.temperature = weatherData.main.temp
    }
}


