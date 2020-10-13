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
    @State var addCityViewShown: Bool = false;
    
    init() {
        controller.loadWeatherReports();
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if controller.currentLocation >= controller.cities.count {
                    Text("Current location not selected.").bold()
                        .foregroundColor(Color.white)
                        .font(.system(size:CGFloat(sectionHeaderSize)))
                        .frame(height: 250)
                    
                } else {
                    BriefOverview(isMetric: self.controller.isMetric, report: controller.reports[controller.currentLocation])
                        .padding(.top)
                }
                
                HStack {
                    ToggleTemperature(controller: self.controller)
                    Spacer()
                    Button(action: {
                        self.addCityViewShown.toggle();
                    }) {
                        Image(systemName: "plus")
                    }
                }.padding(.leading).padding(.trailing)
                SnapshotList(controller: self.controller, isMetric: self.controller.isMetric, reports: controller.reports)
                Spacer()
            }.background(Color.lightBlue)
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.sheet(isPresented: $addCityViewShown) {
            AddCityModal(controller: self.controller)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
