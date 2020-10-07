//
//  ApiCalls.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/6/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

private let url = "http://api.weatherapi.com/v1/current.json?key=9793964830b44e928f3182858200510&q=";
private let forecastedFor = "&days=";

// MARK: getUrl
private func getUrl(city: String, days: String = nil) -> String{
    if days == nil {
        return url + city;
    } else {
        return url + city + forecastedFor + days
    }
}

// MARK: getWeatherSnapshot
private func getWeatherSnapshot(city: String) -> Snapshot {
    URLSession.shared.dataTask(with: URL(getUrl(city))!, completionHandler: {
        guard let data = data, error == nil else {
            print("Failed to retrieve weather data for \(city).");
            return;
        }
        
        var responseBody: Snapshot?;
        
        do {
            responseBody = try JSONDecoder().decode(Snapshot.self, from: data);
        } catch {
            print(error);
        }
        
        guard let json = responseBody else {
            print("Failed to unwrap response body.")
            return;
        }
        return json;
    }).resume();
}
