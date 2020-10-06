//
//  GetWeatherData.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation


private let url: String 

private func getWeatherData() {
    
    URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
        guard let data = data, error == nil else {
            print("Failed to retrieve weather data.")
            return
        }
        
        var body: ResponseBody?
        
        do {
            body = try JSONDecoder().decode(ResponseBody.self, from: data);
        } catch {
            print(error)
        }
        
        guard let json = body else {
            print("Failed to unwrap response body.")
            return;
        }
        
        print(json.location.name)
        print("\(json.current.temp_f) F")
        print("\(json.current.feelslike_f) F")
        print(json.current.condition.text)
        
    }).resume();
}
