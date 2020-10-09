//
//  DataStructs.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation
import SwiftUI

//  MARK: Snapshot
//  Used to decode JSON response bodies for current weather snapshots. 
struct Snapshot: Codable, Hashable {
    var location: Location;
    var current: Current;
}

//  Extension that makes Snapshot identifiable.
//  Id is a String of the city name and country.
extension Snapshot: Identifiable {
    var id: String {
        return location.name + ", " + location.country
    }
}

//  MARK: Report
struct Report: Codable, Hashable {
    var location: Location;
    var current: Current;
    var forecast: Forecast;
}

//  Extension that makes Snapshot identifiable.
//  Id is a String of the city name and country.
extension Report: Identifiable {
    var id: String {
        return location.name + ", " + location.country
    }
}


//  MARK: Location
//  Contains information related to the location of the weather snapshot.
struct Location: Codable, Hashable {
    let name: String;
    let region: String;
    let country: String;
    let lat: Double;
    let lon: Double;
    let tz_id: String;
    let localtime_epoch: Int;
    let localtime: String;
}

extension Location {
    var current_time: Date {
        return Date(timeIntervalSince1970: Double(localtime_epoch));
    }
}

//  MARK: Current
//  Contains information about the weather snapshot.
struct Current: Codable, Hashable {
    let last_updated_epoch: Int;
    let last_updated: String;
    let temp_c: Double;
    let temp_f: Double;
    let is_day: Int;
    let condition: Condition;
    let wind_mph: Double;
    let wind_kph: Double;
    let wind_dir: String;
    let humidity: Int;
    let feelslike_c: Double;
    let feelslike_f: Double;
    let vis_km: Double;
    let vis_miles: Double;
}

//  Extension adds an Image field to Current using the given image url in condition.
extension Current {
    var image: Image {
        var imageId: String = String(String(condition.icon.suffix(7)).prefix(3));
        
        if is_day == 1 {
            imageId = "day" + imageId;
        }
        return Image(imageId);
    }
}

//  MARK: Condition
//  Contains weather description and weather image.
struct Condition: Codable, Hashable {
    let text: String;
    let icon: String;
}


//  MARK: Forecast
struct Forecast: Codable, Hashable {
    let forecastday: [ForecastDay];
}

//  MARK: ForecastDay
struct ForecastDay: Codable, Hashable {
    let date: String;
    let date_epoch: Int;
    let day: Day;
    let astro: Astro;
    let hour: [Hour];
}

extension ForecastDay {
    var current_time: Date {
        return Date(timeIntervalSince1970: Double(date_epoch));
    }
}


// MARK: Day
struct Day: Codable, Hashable {
    let maxtemp_c: Double;
    let maxtemp_f: Double;
    let mintemp_c: Double;
    let mintemp_f: Double;
    let totalprecip_mm: Double;
    let totalprecip_in: Double;
    let condition: Condition;
    let daily_will_it_rain: Int;
    let daily_will_it_snow: Int;
    let daily_chance_of_rain: String;
    let daily_chance_of_snow: String;
}

extension Day {
    var image: Image {
        // Get the image id number
        var imageId: String = String(String(condition.icon.suffix(7)).prefix(3));
        return Image("day" + imageId);
    }
}



// MARK: Astro
struct Astro: Codable, Hashable {
    let sunrise: String;
    let sunset: String;
}

// MARK: Hour
struct Hour: Codable, Hashable {
    let time_epoch: Int;
    let temp_c: Double;
    let temp_f: Double;
    let is_day: Int;
    let condition: Condition;
    let will_it_rain: Int;
    let will_it_snow: Int;
    let chance_of_rain: String;
    let chance_of_snow: String;
}

extension Hour {
    var time: Date {
        return Date(timeIntervalSince1970: Double(time_epoch));
    }
}

//  Extension adds an Image field to Hour using the given image url in condition.
extension Hour {
    var image: Image {
        // Get the image id number
        var imageId: String = String(String(condition.icon.suffix(7)).prefix(3));
        // If it is currently day, add "day" prefix
        if is_day == 1 {
            imageId = "day" + imageId;
        }
        return Image(imageId);
    }
}
