//
//  CityList.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct SnapshotList: View {
    @ObservedObject var controller: WeatherDataController;
    var isMetric: Bool;
    var reports: [Report];
    
    init(controller: WeatherDataController, isMetric: Bool, reports: [Report]) {
        self.controller = controller;
        self.isMetric = isMetric;
        self.reports = reports;
        UITableView.appearance().backgroundColor = .clear;
        UITableViewCell.appearance().backgroundColor = .clear;
    }
    
    var body: some View {
        List {
            ForEach(reports, id: \.id) { report in
                NavigationLink(destination: DetailedWeatherReport(isMetric: self.isMetric, report: report)) {
                    VStack(spacing:0) {
                        SnapshotRow(isMetric: self.isMetric, report: report)
                    }
                }.buttonStyle(PlainButtonStyle())
            }.onDelete(perform: controller.removeCity)
            .onMove(perform: controller.moveCity)
        }.navigationBarItems(trailing: EditButton())
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotList(controller: WeatherDataController(), isMetric: true, reports: [testReport]).background(Color.lightBlue)
    }
}
