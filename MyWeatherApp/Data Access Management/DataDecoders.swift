//
//  DataDecoders.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation


//  MARK: decodeWeatherReport
func decodeWeatherReport(data: Data) -> Report? {
    print("Attempting to decode weather data from response body...")
    var newReport: Report?;
    
    do {
        newReport = try JSONDecoder().decode(Report.self, from: data);
    } catch {
        print(error);
    }
    return newReport;
}

//  MARK: decodeCitySuggestions
func decodeCitySuggestions(data: Data) -> [LocationSuggestion]? {
    print("Attempting to decode city suggestions from response body...")
    var suggestions: [LocationSuggestion]?;
    
    do {
        suggestions = try JSONDecoder().decode([LocationSuggestion].self, from: data);
    } catch {
        print(error);
    }
    return suggestions;
}
