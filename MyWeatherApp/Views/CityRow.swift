//
//  CityRow.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct CityRow: View {
    var image: String;
    var report: String;
    var city: String;
    var temp: Double;
    
    var body: some View {
        HStack() {
            Image(image)
            Text(String(format: "%.f", temp))
                .bold()
                .font(.system(size: 32))
            Spacer()
            VStack (alignment: .leading) {
                Text(city).bold().font(.system(size: 20))
                Text(report).font(.subheadline)
            }
        }.padding(.horizontal)
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        CityRow(image: "day113", report: "Scattered Thunderstorms", city: "Chicago, IL", temp: 72.3)
    }
}
