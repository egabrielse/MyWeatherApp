//
//  CurrentForecast.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/7/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct BriefOverview: View {
    var isMetric: Bool;
    var report: Report;
    
    var body: some View {
        VStack(spacing: 0) {
            // City of current weather
            Text(report.location.name)
                .fontWeight(.light)
                .foregroundColor(Color.white)
                .font(.system(size:50))
                .shadow(radius: 2)
                .frame(height: 45)
                .padding(.vertical)
            
             
            // Current temperature
            Text(isMetric ?
                report.current.print_temp_c :
                report.current.print_temp_f)
                .foregroundColor(Color.white)
                .font(.system(size:100))
                .fontWeight(.thin)
                .shadow(radius: 2)
                .frame(height: 90)
                .frame(maxWidth:.infinity)
            
            // Hstack containts: weather high, low, and image
            HStack {
                // Highest temperature of the day
                Text(isMetric ? report.forecast.forecastday[0].day.print_maxtemp_c : report.forecast.forecastday[0].day.print_maxtemp_f)
                    .foregroundColor(Color.white)
                    .font(.system(size:32))
                    .shadow(radius: 2)
                
                // Image description of current weather
                report.current.image.resizable().frame(height:100).frame(width:100)
                
                // Lowest temperature of the day
                Text(isMetric ? report.forecast.forecastday[0].day.print_mintemp_c : report.forecast.forecastday[0].day.print_mintemp_f)
                    .foregroundColor(Color.white)
                    .font(.system(size:32))
                    .shadow(radius: 2)
            }
            
            // Current weather description
            Text(report.current.condition.text)
                .foregroundColor(Color.white)
                .font(.system(size: 24))
                .shadow(radius: 2)
                
        }.padding(.top)
        .frame(maxWidth: .infinity)
    }
}

struct CurrentForecast_Previews: PreviewProvider {
    static var previews: some View {
        BriefOverview(isMetric: true, report: testReport).background(Color.lightBlue)
        
    }
}
