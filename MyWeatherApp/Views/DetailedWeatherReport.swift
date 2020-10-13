//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DetailedWeatherReport: View {
    var isMetric: Bool;
    var report: Report;
    
    var body: some View {
        
        VStack(spacing:0) {
            BriefOverview(isMetric: isMetric, report: report)
            Divider()
            ScrollView {
                VStack(spacing:0) {
                    HourlyForecastList(isMetric: isMetric, hourlyForecast: report.hours_24)
                    Divider()
                    DailyForecastList(isMetric: isMetric, dailyForecast: report.forecast.forecastday)
                    Divider()
                    DetailList(isMetric: isMetric, current: report.current, day: report.forecast.forecastday[0].day, astro: report.forecast.forecastday[0].astro)
                }.padding(.bottom)
            }
        }.background(Color.lightBlue)
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            DetailedWeatherReport(isMetric: true, report: testReport)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}


