//
//  AsyncViewModel.swift
//  await async tutorial
//
//  Created by Ameen Mustafa on 4/27/22.
//

import Foundation

class AsyncViewModel: ObservableObject {
    
    @Published var temp = 0.0
    
    @MainActor
    func executeSearch(for cityId: String) async -> Double {
        // here you can include code for a progress animation that lets users know a search is in progress.
        temp = await asyncCall(for: cityId)
        return temp
    }
    
    func asyncCall(for cityId: String) async -> Double {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityId)&appid=8984d739fa91d7031fff0e84a3d2c520&units=imperial") else {fatalError("Missing URL")}
            let urlRequest = URLRequest(url: url)
            do {
                
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    return -1
                }
                if let weather = self.parseJSON(data) {
                    return weather.temperature
                }
                
            } catch {
                return -1
            }
        return 0.0
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(cityName: name, temperature: temp)
            return weather
        } catch {
            return nil
        }
    }
}
