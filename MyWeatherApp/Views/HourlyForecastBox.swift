//
//  HourForecastBox.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/7/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct HourlyForecastBox: View {
    var hour: Hour;
    
    var body: some View {
        VStack(spacing: 0) {
            // Temperature:
            Text(hour.print_temp_f)
                .font(.system(size: 20))
                .foregroundColor(Color.white)
                .shadow(radius: 2)
            
            // Image:
            hour.image.resizable().frame(width: 35).frame(height:35)
            
            Text(hour.print_chance_of_rain)
                .font(.system(size:12))
                .foregroundColor(Color.blue)
                .bold()
                .frame(height: 20)

            Text(hour.print_time)
                .font(.system(size: 20))
                .foregroundColor(Color.white)
                .shadow(radius: 2)
        }.frame(height:110).padding(.trailing).padding(.leading)
        
            
    }
}

struct HourForecastBox_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView (.horizontal, showsIndicators: true) {
             HStack {
                HourlyForecastBox(hour: testReport.forecast.forecastday[1].hour[3])
                HourlyForecastBox(hour: testReport.forecast.forecastday[1].hour[4])
                HourlyForecastBox(hour: testReport.forecast.forecastday[1].hour[5])
                HourlyForecastBox(hour: testReport.forecast.forecastday[1].hour[6])
                HourlyForecastBox(hour: testReport.forecast.forecastday[1].hour[7])
                HourlyForecastBox(hour: testReport.forecast.forecastday[1].hour[8])
                HourlyForecastBox(hour: testReport.forecast.forecastday[1].hour[9])
             }.background(Color.lightBlue)
        }.frame(height: 100)
    }
}
