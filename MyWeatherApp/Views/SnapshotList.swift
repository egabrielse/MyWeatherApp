//
//  CityList.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct SnapshotList: View {
    var snapshots: [Snapshot];
    
    var body: some View {
        List {
            ForEach(snapshots, id: \.id) { snap in
                SnapshotRow(snapshot: snap);
            }
        }
    }
}

struct CityList_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotList(snapshots: testSnapshots)
    }
}
