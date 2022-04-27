//
//  WeatherModel.swift
//  await async tutorial
//
//  Created by Ameen Mustafa on 4/27/22.
//

import Foundation


struct WeatherModel {
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
}


