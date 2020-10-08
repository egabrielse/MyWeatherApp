//
//  DataDecoders.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import Foundation


//  MARK: decodeWeatherSnapshot
func decodeWeatherSnapshot(data: Data) -> Snapshot? {
    var newSnapshot: Snapshot?;
    
    do {
        newSnapshot = try JSONDecoder().decode(Snapshot.self, from: data);
    } catch {
        print(error);
    }
    return newSnapshot;
}


//  MARK: decodeWeatherReport
func decodeWeatherReport(data: Data) -> Report? {
    var newReport: Report?;
    
    do {
        newReport = try JSONDecoder().decode(Report.self, from: data);
    } catch {
        print(error);
    }
    return newReport;
}
