//
//  Data.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation

let testSnapshots: [Snapshot] = load("currentWeather.json");
let testUniqueSnapshots: [UniqueSnapshot] = identify(snapshots: testSnapshots);

private var identifier = 1000;

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func identify(snapshots: [Snapshot]) -> [UniqueSnapshot] {
    var uniqeSnaps: [UniqueSnapshot] = [UniqueSnapshot]();
    
    for snap in snapshots {
        var unique: UniqueSnapshot;
        unique = UniqueSnapshot(id: identifier, location: snap.location, current: snap.current)
        identifier += 1;
        uniqeSnaps.append(unique);
    }
    
    return uniqeSnaps;
}
