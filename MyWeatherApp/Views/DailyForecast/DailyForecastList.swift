//
//  DailyForecastList.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DailyForecastList: View {
    var dailyForecast: [ForecastDay];
    
    var body: some View {
        VStack(alignment:.leading,spacing:0) {
            Text("3-Day Forecast").bold()
                .foregroundColor(Color.white)
                .font(.system(size:24))
                .opacity(0.5)
                .shadow(radius: 2)
                .padding(.leading)
                .padding(.top)
            ForEach(dailyForecast, id: \.date_epoch) {day in
                DailyForecastRow(forecastDay: day)
            }
        }
    }
}

struct DailyForecastList_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastList(dailyForecast: testReport.forecast.forecastday)
            .background(Color.lightBlue)
    }
}
