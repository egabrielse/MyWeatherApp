//
//  DetailList.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/9/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DetailList: View {
    var isMetric: Bool;
    var current: Current;
    var day: Day;
    var astro: Astro;
    
    var body: some View {
        VStack(alignment:.leading, spacing:10) {
            Text("Current Weather Details").bold()
                .foregroundColor(Color.white)
                .font(.system(size:CGFloat(sectionHeaderSize)))
                .opacity(0.75)
                .shadow(radius: 2)
                .padding(.leading)
                .padding(.top)
            DetailRow(leftTitle: "Sunrise", rightTitle: "Sunset", leftValue: astro.sunrise, rightValue: astro.sunset)
            
            DetailRow(leftTitle: "Humidity", rightTitle: "Feels Like", leftValue:
            current.print_humidity, rightValue: isMetric ?
                current.print_feelslike_c :
                current.print_feelslike_f)
            
            DetailRow(leftTitle: "Chance of Rain", rightTitle: "Chance of Snow", leftValue: day.print_daily_chance_of_rain, rightValue: day.print_daily_chance_of_snow)
            
            DetailRow(leftTitle: "Precipitation", rightTitle: "Wind",
                leftValue: isMetric ?
                    day.print_totalprecip_mm :
                    day.print_totalprecip_in,
                rightValue: isMetric ?
                    current.print_wind_kph :
                    current.print_wind_mph)
            
            DetailRow(leftTitle: "Visibility", rightTitle: "UV Index", leftValue: isMetric ?
                current.print_vis_kilo :
                current.print_vis_miles, rightValue: current.print_uv)
            
            
        }
    }
}

struct DetailList_Previews: PreviewProvider {
    static var previews: some View {
        DetailList(isMetric: true, current: testReport.current, day: testReport.forecast.forecastday[0].day, astro: testReport.forecast.forecastday[0].astro)
            .background(Color.lightBlue)
    }
}
