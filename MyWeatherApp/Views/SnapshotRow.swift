//
//  CityRow.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct SnapshotRow: View {
    var snapshot: Snapshot;
    
    var body: some View {
        HStack() {
            VStack (alignment: .leading) {
                Text(snapshot.location.name).bold().font(.system(size: 20))
                Text(snapshot.current.condition.text).font(.subheadline)
            }
            Spacer()
            snapshot.current.image.frame(height:35);
            Text(String(format: "%.f\u{00B0}", snapshot.current.temp_f))
                .bold()
                .font(.system(size: 32))
        }.padding(.horizontal)
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            SnapshotRow(snapshot: testSnapshots[0])
            SnapshotRow(snapshot: testSnapshots[1])
            SnapshotRow(snapshot: testSnapshots[2])
        }
        
    }
}
