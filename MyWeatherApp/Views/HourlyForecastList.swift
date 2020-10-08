//
//  HourlyForecastList.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/8/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct HourlyForecastList: View {
    var hourlyForecast: [Hour];
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(hourlyForecast, id: \.time_epoch) {hour in
                    HourlyForecastBox(hour: hour);
                }
            }
        }
    }
}

struct HourlyForecastList_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastList(hourlyForecast: testReport.forecast.forecastday[1].hour)
            .background(Color.lightBlue)
    }
}
