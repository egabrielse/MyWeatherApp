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
                if controller.cl >= controller.cities.count {
                    Button(action: {
                        self.addCityViewShown.toggle();
                    }) {
                        Text("Tap here to select a location.").bold()
                        .foregroundColor(Color.white)
                        .font(.system(size:CGFloat(sectionHeaderSize)))
                    }.frame(height: 300)
                    
                } else {
                    BriefOverview(isMetric: self.controller.isMetric, report: controller.reports[controller.cl])
                        .padding(.top)
                }
                
                HStack {
                    ToggleTemperature(controller: self.controller)
                        .padding(.leading)
                    Spacer()
                    Button(action: {
                        self.addCityViewShown.toggle();
                    }) {
                        Image(systemName: "plus").resizable().frame(width: 16, height: 16)
                    }.padding(.trailing)
                }.padding(.horizontal)
                
                SnapshotList(controller: self.controller, isMetric: self.controller.isMetric, reports: controller.reports)
            }.background(Color.lightBlue)
            .edgesIgnoringSafeArea(.top)
            .navigationBarTitle("")
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
