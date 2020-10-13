//
//  ToggleTemperature.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/13/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct ToggleTemperature: View {
    @ObservedObject var controller: WeatherDataController;
    
    var body: some View {
        Button(action: {
            self.controller.toggleIsMetric()
        }) {
            if controller.isMetric {
                HStack(spacing:1) {
                    Text("C").bold()
                    Text("/").bold()
                    Text("F").bold().opacity(0.5)
                }
            } else {
                HStack(spacing:1) {
                    Text("C").bold().opacity(0.5)
                    Text("/").bold()
                    Text("F").bold()
                }
            }
        }

    }
}

struct ToggleTemperature_Previews: PreviewProvider {
    static var previews: some View {
        ToggleTemperature(controller: WeatherDataController())
    }
}
