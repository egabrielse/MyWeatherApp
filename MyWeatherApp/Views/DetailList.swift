//
//  DetailList.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/9/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DetailList: View {
    var current: Current;
    var day: Day;
    var astro: Astro;
    
    private func formatWind(metric: Bool, speed: Double, dir: String) -> String {
        if metric {
            return dir + String(speed) + " kph"
        } else {
            return dir + String(speed) + " mph"
        }
    }
    
    private func formatVis(metric: Bool, visibility: Double) -> String {
        if metric {
            return String(visibility) + " kilometers"
        } else {
            return String(visibility) + " miles"
        }
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing:0) {
            Text("Current Weather Details").bold()
                .foregroundColor(Color.white)
                .font(.system(size:20))
                .opacity(0.75)
                .shadow(radius: 2)
                .padding(.leading)
                .padding(.top)
            DetailRow(leftTitle: "Sunrise", rightTitle: "Sunset", leftValue: astro.sunrise, rightValue: astro.sunset)
            
            DetailRow(leftTitle: "Humidity", rightTitle: "Feels Like", leftValue:
            current.print_humidity, rightValue: current.print_feelslike_f)
            
            DetailRow(leftTitle: "Chance of Rain", rightTitle: "Chance of Snow", leftValue: day.print_daily_chance_of_rain, rightValue: day.print_daily_chance_of_snow)
            
            DetailRow(leftTitle: "Precipitation", rightTitle: "Wind", leftValue: day.print_totalprecip_in, rightValue: current.print_wind_mph)
            
            DetailRow(leftTitle: "Visibility", rightTitle: "UV Index", leftValue: current.print_vis_miles, rightValue: current.print_uv)
            
            
        }
    }
}

struct DetailList_Previews: PreviewProvider {
    static var previews: some View {
        DetailList(current: testReport.current, day: testReport.forecast.forecastday[0].day, astro: testReport.forecast.forecastday[0].astro)
            .background(Color.lightBlue)
    }
}
