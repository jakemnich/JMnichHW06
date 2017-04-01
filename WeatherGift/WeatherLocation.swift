//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Jake Mnich on 3/25/17.
//  Copyright © 2017 Jake Mnich. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = -999.999
    var dailySummary = ""
    var currentIcon = ""
    var currentTime = 0.0
    var timeZone = ""
    
    
    func getWeather(completed: @escaping () -> ()) {
        
        let weatherURL = urlBase + urlAPIKey + coordinates
        print(weatherURL)
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                 if let temperature = json["currently"]["temperature"].double {
                    print("Temp inside getWeather = \(temperature)")
                    self.currentTemp = temperature
                } else {
                    print("could not return a temperature!")
                }
                if let summary = json["daily"]["summary"].string {
                    print("Summary inside getWeather = \(summary)")
                    self.dailySummary = summary
                } else {
                    print("could not return a summary!")
                }
                if let icon = json["currently"]["icon"].string {
                    print("Icon inside getWeather = \(icon)")
                    self.currentIcon = icon
                } else {
                    print("could not return an icon!")
                }
                if let time = json["currently"]["time"].double {
                    print("Time inside getWeather = \(time)")
                    self.currentTime = time
                } else {
                    print("could not return a time")
                }
                if let timeZone = json["timezone"].string {
                    print("TimeZone inside getweather = \(timeZone)")
                    self.timeZone = timeZone
                } else {
                    print("could not return a timeZone")
                }
                
                case .failure(let error):
                print(error)
            }
            print("**** ")
            completed()
        }
    }
}
