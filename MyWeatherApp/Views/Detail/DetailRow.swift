//
//  DetailRow.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/9/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DetailRow: View {
    var leftTitle: String;
    var rightTitle: String;
    var leftValue: String;
    var rightValue: String;
    
    var body: some View {
        HStack {
            DetailBox(title: leftTitle, value: leftValue)
                .frame(maxWidth:.infinity)
            DetailBox(title: rightTitle, value: rightValue)
                .frame(maxWidth:.infinity)
        }.frame(maxWidth:.infinity)
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(leftTitle: "Sunrise", rightTitle: "Sunset", leftValue: "06:57", rightValue: "18:17")
        .background(Color.lightBlue)
    }
}
