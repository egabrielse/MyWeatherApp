//
//  DataStructs.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

// MARK: Response Body
struct ResponseBody: Codable {
    let location: Location;
    let current: Current;
}

// MARK: Location
struct Location: Codable {
    let name: String;
    let region: String;
    let country: String;
    let lat: Double;
    let lon: Double;
    let tz_id: String;
    let localtime_epoch: Int;
    let localtime: String;
}

// MARK: Current
struct Current: Codable {
    let last_updated_epoch: Int;
    let last_updated: String;
    let temp_c: Double;
    let temp_f: Double;
    let is_day: Int;
    let condition: Condition;
    let wind_mph: Double;
    let wind_kph: Double;
    let wind_degree: Int;
    let wind_dir: String;
    let humidity: Int;
    let cloud: Int;
    let feelslike_c: Double;
    let feelslike_f: Double;
    let vis_km: Double;
    let vis_miles: Double;
    let uv: Double;
}

// MARK: Condition
struct Condition: Codable {
    let text: String;
    let icon: String;
    let code: Int;
}


/*
 * MARK: Example JSON Response Body
 *
 {
     "location": {
         "name": "London",
         "region": "City of London, Greater London",
         "country": "United Kingdom",
         "lat": 51.52,
         "lon": -0.11,
         "tz_id": "Europe/London",
         "localtime_epoch": 1601928786,
         "localtime": "2020-10-05 21:13"
     },
    "current": {
        "last_updated_epoch": 1601928005,
        "last_updated": "2020-10-05 21:00",
        "temp_c": 14.0,
        "temp_f": 57.2,
        "is_day": 1,
        "condition": {
            "text": "Partly cloudy",
            "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
            "code": 1003
        },
        "wind_mph": 16.1,
        "wind_kph": 25.9,
        "wind_degree": 250,
        "wind_dir": "WSW",
        "humidity": 77,
        "cloud": 50,
        "feelslike_c": 12.2,
        "feelslike_f": 54.0,
        "vis_km": 10.0,
        "vis_miles": 6.0,
        "uv": 3.0
    },
    "forecast": {
        "forecastday": [
            {
                "date": "2020-10-05",
                "date_epoch": 1601856000,
                "day": {
                    "avgtemp_c": 12.7,
                    "avgtemp_f": 54.8,
                    "daily_chance_of_rain": "82",
                    "daily_chance_of_snow": "0",
                    "condition": {
                        "text": "Patchy rain possible",
                        "icon": "//cdn.weatherapi.com/weather/64x64/day/176.png",
                        "code": 1063
                    }
                },
                "astro": {
                    "sunrise": "07:08 AM",
                    "sunset": "06:28 PM"
                },
                "hour": [
                    {
                        "time_epoch": 1601852400,
                        "time": "2020-10-05 00:00",
                        "temp_c": 11.1,
                        "temp_f": 52.0,
                        "condition": {
                            "text": "Overcast",
                            "icon": "//cdn.weatherapi.com/weather/64x64/night/122.png",
                            "code": 1009
                        },
                        "feelslike_c": 8.8,
                        "feelslike_f": 47.8,
                        "chance_of_rain": "0",
                        "chance_of_snow": "0"
                    },
                    ...
                ]
            },
            ...
        ]
    },
    "alert": {
 
    }
 
 */
