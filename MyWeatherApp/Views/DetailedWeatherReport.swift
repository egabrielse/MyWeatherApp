//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DetailedWeatherReport: View {
    var report: Report;
    
    var body: some View {
        
        VStack(spacing:0) {
            BriefOverview(report: report)
            Divider()
            ScrollView {
                VStack(spacing:0) {
                    HourlyForecastList(hourlyForecast: report.hours_24)
                    Divider()
                    DailyForecastList(dailyForecast: report.forecast.forecastday)
                    Divider()
                    DetailList(current: report.current, day: report.forecast.forecastday[0].day, astro: report.forecast.forecastday[0].astro)
                }
            }
        }.background(Color.lightBlue)
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            DetailedWeatherReport(report: testReport)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}


