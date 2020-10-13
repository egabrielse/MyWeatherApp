//
//  DailyForecastRow.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DailyForecastRow: View {
    var isMetric: Bool;
    var forecastDay: ForecastDay;
    
    var body: some View {
        HStack{
            Text(forecastDay.day_of_the_week).bold()
                .font(.system(size:20))
                .foregroundColor(Color.white)
                .shadow(radius: 2)
                .frame(width:125)
            Spacer()
            forecastDay.day.image.resizable().frame(height: 35).frame(width:35)
            Spacer()
            Text(isMetric ?
                forecastDay.day.print_maxtemp_c :
                forecastDay.day.print_maxtemp_f)
                .bold()
                .font(.system(size:20))
                .foregroundColor(Color.white)
                .shadow(radius: 2)
                
            Text(isMetric ?
            forecastDay.day.print_mintemp_c :
            forecastDay.day.print_mintemp_f)
                .bold()
                .font(.system(size:20))
                .foregroundColor(Color.white)
                .shadow(radius: 2)
        }.padding(.trailing).padding(.leading)
    }
}

struct DailyForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Divider()
            DailyForecastRow(isMetric: true, forecastDay: testReport.forecast.forecastday[0])
            Divider()
            DailyForecastRow(isMetric: true, forecastDay: testReport.forecast.forecastday[1])
            Divider()
            DailyForecastRow(isMetric: true, forecastDay: testReport.forecast.forecastday[2])
            Divider()
        }.background(Color.lightBlue)
        
    }
}
