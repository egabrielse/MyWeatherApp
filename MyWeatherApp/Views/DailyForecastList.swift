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
        VStack {
            Divider()
            ForEach(dailyForecast, id: \.date_epoch) {day in
                VStack {
                    DailyForecastRow(forecastDay: day)
                    Divider()
                }
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
