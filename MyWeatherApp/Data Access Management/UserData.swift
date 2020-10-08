//
//  UserData.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/7/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

enum Measurement: String {
    case f = "Fahrenheit";
    case c = "Celsius";
}
final class UserData: ObservableObject {
    // TODO: At the moment, only displaying fahrenheit.
    // Will later be updated to display fahrenheit or celsius
    @Published var isCelsius: Measurement = Measurement.f;
    @Published var cities: [String] = ["Chicago", "New York", "San Francisco", "Austin"];
    @Published var snapshots: [Snapshot] = testSnapshots;
    @Published var current: Report = testReport;
}
