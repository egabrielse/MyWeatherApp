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
    
    var body: some View {
        HStack {
            Text("S")
        }
    }
}

struct DailyForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastRow(forecastDay: testReport.forecast.forecastday[1])
    }
}
