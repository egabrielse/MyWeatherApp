//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData;
    
    var body: some View {
        
        VStack(spacing:0) {
            BriefOverview(report: testReport)
            Divider()
            ScrollView {
                VStack(spacing:0) {
                    HourlyForecastList(hourlyForecast: testReport.forecast.forecastday[1].hour)
                    Divider()
                    DailyForecastList(dailyForecast: testReport.forecast.forecastday)
                    Divider()
                    DetailList(current: testReport.current, astro: testReport.forecast.forecastday[0].astro)
                }.padding(.top).padding(.bottom)
            }
        }.background(Color.lightBlue)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            ContentView().environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}


