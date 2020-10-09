//
//  DailyForecastRow.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DailyForecastRow: View {
    var forecastDay: ForecastDay;
    
    private func getDayOfTheWeek(date: Date) -> String{
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEEE";
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack{
            Text(getDayOfTheWeek(date: forecastDay.current_time)).bold()
                .font(.system(size:20))
                .foregroundColor(Color.white)
                .shadow(radius: 2)
                .frame(width:125)
            Spacer()
            forecastDay.day.image.resizable().frame(height: 35).frame(width:35)
            Spacer()
            Text("H: " + String(format: "%.f\u{00B0}", forecastDay.day.maxtemp_f)).bold()
                .font(.system(size:20))
                .foregroundColor(Color.white)
                .shadow(radius: 2)
                
            Text("L: " + String(format: "%.f\u{00B0}", forecastDay.day.mintemp_f)).bold()
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
            DailyForecastRow(forecastDay: testReport.forecast.forecastday[0])
            Divider()
            DailyForecastRow(forecastDay: testReport.forecast.forecastday[1])
            Divider()
            DailyForecastRow(forecastDay: testReport.forecast.forecastday[2])
            Divider()
        }.background(Color.lightBlue)
        
    }
}
