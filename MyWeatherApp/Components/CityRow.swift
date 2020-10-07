//
//  CityRow.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct CityRow: View {
    var snapshot: UniqueSnapshot;
    
    var body: some View {
        HStack() {
            VStack (alignment: .leading) {
                Text(snapshot.location.name).bold().font(.system(size: 20))
                Text(snapshot.current.condition.text).font(.subheadline)
            }
            Spacer()
            Text(String(format: "%.f\u{00B0}", snapshot.current.temp_f))
                .bold()
                .font(.system(size: 32))
            
            
        }.padding(.horizontal)
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            CityRow(snapshot: uniqueSnapshots[0])
            CityRow(snapshot: uniqueSnapshots[1])
            CityRow(snapshot: uniqueSnapshots[2])
        }
        
    }
}
