//
//  ContentView.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData;
    
    var body: some View {
        
        VStack(spacing:0) {
            BriefOverview(report: testReport)
            Divider()
            HourlyForecastList(hourlyForecast: testReport.forecast.forecastday[1].hour)
        }.background(Color.lightBlue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}


