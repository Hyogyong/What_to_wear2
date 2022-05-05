//
//  Network.swift
//  what to wear
//
//  Created by 이효경 on 2022/05/01.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    @Published var weather: Welcome = Welcome.sample
    
    var apiKey = "96342d2ddb57e5bdc8be2eb6cac5e8aa"

    func getWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=36&lon=129&appid=\(apiKey)") else { fatalError("Missing URL") }
   

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedWeather = try JSONDecoder().decode(Welcome.self, from: data)
                        self.weather = decodedWeather
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
