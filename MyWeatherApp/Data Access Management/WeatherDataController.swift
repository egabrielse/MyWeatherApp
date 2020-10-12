//
//  UserData.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/7/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class WeatherDataController: ObservableObject {
    // TODO: At the moment, only displaying fahrenheit.
    // Will later be updated to display fahrenheit or celsius
    @Published var isCelsius: Bool;
    @Published var currentLocation: Int;
    @Published var cities: [String];
    @Published var reports: [Report];
    

    init() {
        self.isCelsius = UserDefaults.standard.bool(forKey: "isCelsius");
        self.currentLocation = UserDefaults.standard.integer(forKey: "currentLocation");
        self.cities = ["Chicago", "New York", "San Francisco", "Boston"];
        // self.cities = UserDefaults.standard.stringArray(forKey: "cities") ?? [];
        self.reports = [Report]();
    }
    
    func loadWeatherReports(){
        print("Fetching weather reports for selected cities...\n")
        var loadedReports: [Report] = [];
        
        for city in self.cities {
            print("Fetching weather report for \(city)...")
            do {
                let jsonData = try getWeatherData(city: city);
                let report = decodeWeatherReport(data: jsonData!);
                loadedReports.append(report!);
            } catch NetworkError.standard(let message) {
                print("Unable to load weather data for \(city):")
                print("\(message)\n");
            } catch NetworkError.statusCode(let message) {
                print("Unable to load weather data for \(city):")
                print("\(message)\n");
            } catch NetworkError.url(let message) {
                print("Unable to load weather data for \(city):")
                print("\(message)\n");
            } catch NetworkError.timeout(let message) {
                print("Unable to load weather data for \(city):")
                print("\(message)\n");
            } catch {
                print("Unexpected error while loading weather data for \(city): \n");
                print("\(error)\n")
            }
            print("Successfully fetched weather report for \(city)!\n");
        }
        
        if !(self.reports.isEmpty) {
            print("Cleared stale weather reports.")
            self.reports.removeAll();
        }
        
        print("Finished fetching weather reports for selected cities!")
        self.reports = loadedReports;
    }
}

