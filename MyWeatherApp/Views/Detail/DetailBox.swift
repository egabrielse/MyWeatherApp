//
//  DetailBox.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/9/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct DetailBox: View {
    var title: String;
    var value: String;
    
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing:0) {
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size:20))
                    .opacity(0.5)
                    .shadow(radius: 2)
                Text(value).bold()
                    .foregroundColor(Color.white)
                    .font(.system(size:20))
                    .shadow(radius: 2)
                
            }.padding(.leading)
            Spacer()
        }
    }
}

struct DetailBox_Previews: PreviewProvider {
    static var previews: some View {
        DetailBox(title: "Sunrise", value: "06:57")
            .background(Color.lightBlue)
    }
}
