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

//  MARK: WeatherDataController
final class WeatherDataController: ObservableObject {
    
    // Index into cities of current location
    // TODO: Eventually switch over to using CoreLocation.
    @Published var cl: Int;
    @Published var isMetric: Bool;
    @Published var cities: [String];
    @Published var reports: [Report];
    

    init() {
        print("Initializing WeatherDataController.")
        // self.isMetric = true;
        // self.cities = ["Chicago", "New York", "Austin"];
        self.cl = 0;
        self.isMetric = UserDefaults.standard.bool(forKey: "isMetric");
        self.cities = UserDefaults.standard.stringArray(forKey: "cities") ?? [];
        self.reports = [Report]();
    }
    //  MARK: addCity
    func addCity(newCity: String) {
        print("Adding \(newCity) to list of cities.")
        self.cities.append(newCity);
        UserDefaults.standard.set(self.cities, forKey: "cities");
        self.loadWeatherReports();
    }
    
    //  MARK: removeCity
    func removeCity(at offsets: IndexSet) {
        print("Removing city at \(offsets.startIndex) from list of cities.")
        self.cities.remove(atOffsets: offsets);
        self.reports.remove(atOffsets: offsets);
        UserDefaults.standard.set(self.cities, forKey: "cities");
        self.loadWeatherReports();
    }
    
    //  MARK: moveCity
    func moveCity(from source: IndexSet, to destination: Int) {
        print("Moving city at \(source.startIndex) \(destination) in list of cities.")
        self.cities.move(fromOffsets: source, toOffset: destination);
        self.reports.move(fromOffsets: source, toOffset: destination);
        UserDefaults.standard.set(self.cities, forKey: "cities");
    }
    
    //  MARK: toggleIsMetric
    func toggleIsMetric() {
        print("Toggling isMetric \(self.isMetric ? "off" : "on")")
        self.isMetric.toggle();
        UserDefaults.standard.set(self.isMetric, forKey: "isMetric");
        if self.isMetric {
            print("Units of measurement are now Metric.")
        } else {
            print("Units of measurement are now U.S. Customary.")
        }
    }
    
    //  MARK: loadWeatherReports
    func loadWeatherReports(){
        print("Fetching weather reports for selected cities...\n")
        var loadedReports: [Report] = [];
        
        for city in self.cities {
            print("Fetching weather report for \(city)...")
            do {
                let jsonData = try getWeatherData(city: city);
                let report = try decodeWeatherReport(data: jsonData!);
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

