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
    @Published var isMetric: Bool;
    @Published var currentLocation: Int;
    @Published var cities: [String];
    @Published var reports: [Report];
    

    init() {
        self.isMetric = true;
        self.currentLocation = 0;
        self.cities = ["Chicago", "New York", "Austin"];
        
        /*self.isMetric = UserDefaults.standard.bool(forKey: "isMetric");
        self.currentLocation = UserDefaults.standard.integer(forKey: "currentLocation");
        self.cities = UserDefaults.standard.stringArray(forKey: "cities") ?? [];*/
        self.reports = [Report]();
    }
    
    func addCity(newCity: String) {
        self.cities.append(newCity);
        UserDefaults.standard.set(self.cities, forKey: "cities");
        self.loadWeatherReports();
    }
    
    func removeCity(at offsets: IndexSet) {
        self.cities.remove(atOffsets: offsets);
        self.reports.remove(atOffsets: offsets);
        UserDefaults.standard.set(self.cities, forKey: "cities");
        self.loadWeatherReports();
        
        print("Cities = \(self.cities). Number reports = \(self.reports.count)")
    }
    
    func toggleIsMetric() {
        self.isMetric.toggle();
        UserDefaults.standard.set(self.isMetric, forKey: "isMetric");
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
                print("Unexpected error while fetching weather data for \(city): \n");
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

