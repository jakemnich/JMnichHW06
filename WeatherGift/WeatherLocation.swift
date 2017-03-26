//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Jake Mnich on 3/25/17.
//  Copyright © 2017 Jake Mnich. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    
    func getWeather() {
        
        let weatherURL = urlBase + urlAPIKey + coordinates
        print(weatherURL)
        
        Alamofire.request(weatherURL).responseJSON { response in
            print(response)
        }
    }
}
