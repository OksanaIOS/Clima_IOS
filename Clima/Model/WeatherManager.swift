//
//  WeatherManager.swift
//  Clima
//
//  Created by Vladimir on 14/10/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(Constants.id)&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //        create a URL
        guard let url = URL(string: urlString) else { return }
        
        //        create a URL session
        let session = URLSession(configuration: .default)
        
        //        give the session a task
        let task  = session.dataTask(with: url) { data, response, error in
            
            if let error{
                delegate?.didFailWithError(error: error)
                return
            }
            guard let safeData = data else { return }
            guard let weather = parseJSON(safeData) else { return }
            delegate?.didUpdateWeather(weather: weather)
        }
    
            
            //            start the task
            task.resume()
            
        }
        func parseJSON(_ weatherData: Data) -> WeatherModel? {
            let decoder = JSONDecoder()
            do {
                print("weatherData: \(weatherData)")
                if let jsonResponse = String(data: weatherData, encoding: String.Encoding.utf8) {
                    print("Response: \(jsonResponse)")
                }
                let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                
//                let id = decodedData.weather[0].id
//                let temp = decodedData.main.temp
//                let name = decodedData.name
//                let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
                let weather = WeatherModel(weatherData: decodedData)
                return weather
            } catch {
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
    }
    

