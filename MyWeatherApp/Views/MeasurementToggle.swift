//
//  MeasurementToggle.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/12/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct MeasurementToggle: View {
    var isCelsius: Bool;
    
    var body: some View {
        Toggle(isOn: $isCelsius) {
            if isCelsius {
                Text("C/F").bold()
                    .foregroundColor(Color.white)
                    .shadow(radius: 2)
            } else {
                
            }
            
        }
    }
}

struct MeasurementToggle_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementToggle(isCelsius: false)
    }
}
