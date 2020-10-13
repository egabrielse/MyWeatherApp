//
//  DataStructs.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation
import SwiftUI


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

//  Builds a 24 hour long hourly forecast, starting with the current hour. 
extension Report {
    var hours_24: [Hour] {
        var hours: [Hour] = [];
        let fullForecast: [Hour] =
            forecast.forecastday[0].hour +
            forecast.forecastday[1].hour +
            forecast.forecastday[2].hour;
        
        var counter = 24;
        
        for hour in fullForecast {
            if hour.time + 3600 >= location.current_time {
                hours.append(hour);
                counter -= 1;
            }
            if counter == 0 {
                break;
            }
        }
        
        return hours;
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
    let uv: Double;
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

extension Current {
    var print_temp_c: String {
        return String(format: "%.f\u{00B0}", temp_c);
    }
    var print_temp_f: String {
        return String(format: "%.f\u{00B0}", temp_f);
    }
    var print_feelslike_c: String {
        return String(format: "%.f\u{00B0}", feelslike_c);
    }
    var print_feelslike_f: String {
        return String(format: "%.f\u{00B0}", feelslike_f);
    }
    var print_wind_kph: String {
        return wind_dir + " " + String(wind_kph) + " kph";
    }
    var print_wind_mph: String {
        return wind_dir + " " + String(wind_mph) + " mph";
    }
    var print_vis_kilo: String {
        return String(vis_km) + " kilometers";
    }
    var print_vis_miles: String {
        return String(vis_miles) + " miles";
    }
    var print_humidity: String {
        return String(humidity) + "%";
    }
    var print_uv: String {
        return String(uv);
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

extension ForecastDay {
    var day_of_the_week: String {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEEE";
        return dateFormatter.string(from: current_time)
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
        let imageId: String = String(String(condition.icon.suffix(7)).prefix(3));
        return Image("day" + imageId);
    }
}

extension Day {
    var print_maxtemp_c: String {
        return "H: " + String(format: "%.f\u{00B0}", maxtemp_c);
    }
    var print_maxtemp_f: String {
        return "H: " + String(format: "%.f\u{00B0}", maxtemp_f);
    }
    var print_mintemp_c: String {
        return "L: " + String(format: "%.f\u{00B0}", mintemp_c);
    }
    var print_mintemp_f: String {
        return "L: " + String(format: "%.f\u{00B0}", mintemp_f);
    }
    var print_totalprecip_mm: String {
        return String(totalprecip_mm) + " mm"
    }
    var print_totalprecip_in: String {
        return String(totalprecip_in) + " in"
    }
    var print_daily_chance_of_rain: String {
        return daily_chance_of_rain + "%";
    }
    var print_daily_chance_of_snow: String {
        return daily_chance_of_snow + "%";
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
    var print_temp_c: String {
        return String(format: "%.f\u{00B0}", temp_c);
    }
    var print_temp_f: String {
        return String(format: "%.f\u{00B0}", temp_f);
    }
    
    // Data from weather api appears to be incorrect, regarding the will_it_rain
    // and will_it_snow fields. They often are zero, despite chance_of_rain and
    // chance_of_snow being positive
    var print_chance_of_rain: String {
        if chance_of_rain != "0" {
            return String(chance_of_rain) + "%";
        } else {
            return ""
        }
    }
    var print_chance_of_snow: String {
        if chance_of_snow != "0" {
            return String(chance_of_snow) + "%";
        } else {
            return ""
        }
    }
}

extension Hour {
    var time: Date {
        return Date(timeIntervalSince1970: Double(time_epoch));
    }
}

extension Hour {
    var print_time: String {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "HH:mm";
        return dateFormatter.string(from: time)
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

//  MARK: LocationSuggestion
struct LocationSuggestion: Codable, Hashable, Identifiable {
    let id: Int;
    let name: String;
    let region: String;
    let country: String;
}
