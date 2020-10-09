//
//  ApiCalls.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/6/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

fileprivate let snapshotFor = "https://api.weatherapi.com/v1/current.json?key=9793964830b44e928f3182858200510&q=";
fileprivate let forecastFor = "https://api.weatherapi.com/v1/forecast.json?key=9793964830b44e928f3182858200510&q=";

//  MARK: NetworkError
enum NetworkError: Error {
    case statusCode(message: String)
    case url(message: String)
    case timeout(message: String)
    case standard(message: String)
}

//  MARK: getUrl
func getUrl(city: String, days: String? = nil) -> URL {
    var urlString: String;
    if let days = days {
        urlString = forecastFor + city + "&days=" + days
    } else {
        urlString = snapshotFor + city;
    }
    print(urlString)
    return URL(string: urlString)!;
}

//  MARK: getWeatherData
//  Calls the Weather Api to get a weather snapshot for a specific city.
func getWeatherData(city: String, forecasted: Bool) throws -> Data? {
    // Current Async method: Using semaphores to "await" for a response.
    // TODO: Change this to be handled with Futures or Closures
    
    var url: URL;
    if forecasted {
        url = getUrl(city: city, days: "3"); // With free account, limited to 3 day forecast...
    } else {
        url = getUrl(city: city);
    }
    
    let semaphore = DispatchSemaphore(value: 0);
    var data: Data?;
    var response: URLResponse?;
    var error: Error?;
    
    URLSession.shared.dataTask(with: url, completionHandler: {d,r,e in
        data = d;
        response = r;
        error = e;
        semaphore.signal();
    }).resume();
    
    let dispatchResult = semaphore.wait(timeout: DispatchTime.distantFuture);
    
    if dispatchResult == DispatchTimeoutResult.timedOut {
        throw NetworkError.timeout(message: "Api call to has timed out.")
    }
    
    if let httpUrlResponse = response as? HTTPURLResponse {
        if httpUrlResponse.statusCode > 299 || httpUrlResponse.statusCode < 200 {
            throw NetworkError.statusCode(message: "Recieved invalid http status code: " + String(httpUrlResponse.statusCode))
        }
    }
    
    if error != nil {
        throw NetworkError.standard(message: error!.localizedDescription);
    }
    
    return data;
}
