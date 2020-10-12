//
//  CityList.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct SnapshotList: View {
    var reports: [Report];
    
    var body: some View {
        ScrollView {
            ForEach(reports, id: \.id) { report in
                NavigationLink(destination: DetailedWeatherReport(report: report)) {
                    VStack(spacing:0) {
                        SnapshotRow(report: report)
                        Divider()
                    }
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotList(reports: [testReport])
    }
}
