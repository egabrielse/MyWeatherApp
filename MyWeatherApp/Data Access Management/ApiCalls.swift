//
//  ApiCalls.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/6/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

//  MARK: NetworkError
enum NetworkError: Error {
    case statusCode(message: String)
    case url(message: String)
    case timeout(message: String)
    case standard(message: String)
}

enum URLType {
    case forecast;
    case suggestions;
}

//  MARK: Important Note:
//  Currently, you will not be able to use the app as is.
//  The exact url for making api calls is stored in a file that is ignored by git to protect
//  the api key from being overused (there is a limit to the number of requests per key).
//  To run this on your own, create a free account on https://www.weatherapi.com
//  and input your api key in the urls below:
//  let forecastFor = "https://api.weatherapi.com/v1/forecast.json?key=_________________&q=";
//  let suggestions = "https://api.weatherapi.com/v1/search.json?key=_________________&q="

//  MARK: getUrl
func getUrl(city: String, type: URLType) throws -> URL {
    print("Constructing fetch-url...")
    var urlString: String;
    if type == URLType.forecast {
        urlString = forecastFor + city + "&days=3";
    } else if type == URLType.suggestions {
        urlString = suggestions + city;
    } else {
        throw NetworkError.url(message: "Unknown URL type.")
    }

    
    if let spaceCodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
        if let url = URL(string: spaceCodedUrlString) {
            return url;
        } else {
            throw NetworkError.url(message: "Invalid url.")
        }
    } else {
        throw NetworkError.url(message: "Value of url was nil.")
    }
}

//  MARK: getWeatherData
//  Calls the Weather Api to get a weather snapshot for a specific city.
func getWeatherData(city: String) throws -> Data? {
    // Current Async method: Using semaphores to "await" for a response.
    // TODO: Change this to be handled with Futures or Closures
    
    let url: URL = try getUrl(city: city, type: URLType.forecast); // With free account, limited to 3 day forecast...
    
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
    
    print("Waiting on fetch request to return response...")
    let dispatchResult = semaphore.wait(timeout: DispatchTime.distantFuture);
    
    print("Response received!")
    if dispatchResult == DispatchTimeoutResult.timedOut {
        throw NetworkError.timeout(message: "Api call to has timed out...")
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


func getCitySuggestions(city: String) throws -> Data? {
    // Current Async method: Using semaphores to "await" for a response.
    // TODO: Change this to be handled with Futures or Closures
    
    let url: URL = try getUrl(city: city, type: URLType.suggestions); // With free account, limited to 3 day forecast...
    
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
    
    print("Waiting on fetch request to return response...")
    let dispatchResult = semaphore.wait(timeout: DispatchTime.distantFuture);
    
    print("Response received!")
    if dispatchResult == DispatchTimeoutResult.timedOut {
        throw NetworkError.timeout(message: "Api call to has timed out...")
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
