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
            DetailRow(leftTitle: "Sunrise", rightTitle: "Sunset", leftValue: astro.sunrise, rightValue: astro.sunset)
            
            DetailRow(leftTitle: "Humidity", rightTitle: "Feels Like", leftValue:
                String(current.humidity)+"%", rightValue: String(format: "%.f\u{00B0}", current.feelslike_f))
            
            DetailRow(leftTitle: "Visibility", rightTitle: "Wind", leftValue: formatVis(metric: false, visibility: current.vis_miles), rightValue: formatWind(metric: false, speed: current.wind_mph, dir: current.wind_dir))
        }
    }
}

struct DetailList_Previews: PreviewProvider {
    static var previews: some View {
        DetailList(current: testReport.current, astro: testReport.forecast.forecastday[0].astro)
            .background(Color.lightBlue)
    }
}
