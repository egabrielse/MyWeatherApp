//
//  URLGeneration.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

fileprivate let weatherFor = "https://api.weatherapi.com/v1/current.json?key=9793964830b44e928f3182858200510&q=";
fileprivate let forecastedFor = "&days=";

//  MARK: getUrl
fileprivate func getUrl(city: String, days: String? = nil) -> URL {
    var urlString: String;
    if let days = days {
        urlString = weatherFor + city + forecastedFor + days
    } else {
        urlString = weatherFor + city;
    }
    return URL(string: urlString)!;
}
