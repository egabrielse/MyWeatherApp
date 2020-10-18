//
//  CityRow.swift
//  MyWeatherApp
//
//  Created by Ethan Gabrielse on 10/5/20.
//  Copyright © 2020 Ethan Gabrielse. All rights reserved.
//

import SwiftUI

struct SnapshotRow: View {
    var isMetric: Bool;
    var report: Report;
    
    var body: some View {
        HStack() {
            VStack (alignment: .leading) {
                Text(report.location.name).bold().font(.system(size: 20))
                Text(report.current.condition.text).font(.subheadline)
            }
            Spacer()
            report.current.image.resizable().frame(height:50).frame(width:50);
            Text(isMetric ?
                report.current.print_temp_c :
                report.current.print_temp_f)
                .bold()
                .font(.system(size: 32))                
                
        }.padding(.horizontal)
    }
}

struct CityRow_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotRow(isMetric: true, report: testReport)
    }
}
