//
//  MainView.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/10/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var controller: WeatherDataController = WeatherDataController();
    
    init() {
        controller.loadWeatherReports();
    }
    
    var body: some View {
        NavigationView {
            VStack {
                BriefOverview(report: controller.reports[0])
                    .padding(.top)
                Divider()
                SnapshotList(reports: controller.reports)
            }.background(Color.lightBlue)
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
