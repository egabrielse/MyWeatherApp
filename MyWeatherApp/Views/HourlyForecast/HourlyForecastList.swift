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
        
        VStack(alignment:.leading, spacing:0) {
            Text("Hourly Forecast").bold()
                .foregroundColor(Color.white)
                .font(.system(size:24))
                .opacity(0.5)
                .shadow(radius: 2)
                .padding(.leading)
                .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing:0) {
                    ForEach(self.hourlyForecast, id: \.time_epoch) { hour in
                        HourlyForecastBox(hour: hour)
                    }
                }
            }
        }
    }
}

struct HourlyForecastList_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastList(hourlyForecast: testReport.hours_24)
            .background(Color.lightBlue)
    }
}
