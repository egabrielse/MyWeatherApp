//
//  DataDecoders.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation


//  MARK: decodeWeatherReport
func decodeWeatherReport(data: Data) throws -> Report? {
    print("Attempting to decode weather data from response body...")
    var newReport: Report?;
    
    newReport = try JSONDecoder().decode(Report.self, from: data);
    
    print("Successfully decoded weather data from response body...")
    return newReport;
}

//  MARK: decodeCitySuggestions
func decodeCitySuggestions(data: Data) throws -> [LocationSuggestion]? {
    print("Attempting to decode city suggestions from response body...")
    var suggestions: [LocationSuggestion]?;
    
    suggestions = try JSONDecoder().decode([LocationSuggestion].self, from: data);
    
    print("Successfully decoded city suggestions from response body...")
    return suggestions;
}
