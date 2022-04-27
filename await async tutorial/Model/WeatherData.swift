//
//  WeatherData.swift
//  await async tutorial
//
//  Created by Ameen Mustafa on 4/27/22.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
}

