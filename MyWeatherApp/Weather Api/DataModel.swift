//
//  DataStructs.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

//  MARK: Snapshot
//  Used to decode JSON response bodies for current weather snapshots.
//
struct Snapshot: Codable, Hashable {
    let location: Location;
    let current: Current;
}

//  MARK: Unique Snapshot
//  Snapshot with identiable protocol.
//  Used to create lists of weather snapshots.
//
struct UniqueSnapshot: Codable, Identifiable, Hashable {
    init(id:Int, location: Location, current: Current) {
        self.id = id;
        self.location = location;
        self.current = current;
    }
    let id: Int;
    let location: Location;
    let current: Current;
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

//  MARK: Condition
//  Contains weather description and weather image.
struct Condition: Codable, Hashable {
    let text: String;
    let icon: String;
    let code: Int;
}
