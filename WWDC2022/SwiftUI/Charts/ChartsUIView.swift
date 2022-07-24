//
//  ChartsUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 27/6/22.
//

import SwiftUI
import Charts

struct ChartsUIView: View {
    var body: some View {
        VStack {
            Text("Bar Chart")
            Chart {
                ForEach(salesRegional) { region in
                    ForEach(region.sales) { salesman in
                        BarMark(x: .value("Name", salesman.Name),
                                y: .value("Sales", salesman.Sales))
                    }.foregroundStyle(by: .value("Country", region.country))
                        .position(by: .value("Country", region.country))
                }
            }
            
            Text("Line Chart")
            Chart {
                ForEach(salesRegional) { region in
                    ForEach(region.sales) { salesman in
                        LineMark(x: .value("Name", salesman.Name),
                                 y: .value("Sales", salesman.Sales))
                    }.foregroundStyle(by: .value("Country", region.country))
                        .symbol(by: .value("Country", region.country))
                        .interpolationMethod(.catmullRom)
                }
            }
            
            Text("Area Chart")
            Chart {
                ForEach(salesRegional) { region in
                    ForEach(region.sales) { salesman in
                        AreaMark(x: .value("Name", salesman.Name),
                                 y: .value("Sales", salesman.Sales))
                    }.foregroundStyle(by: .value("Country", region.country))
                }
            }
        }.navigationTitle("Charts").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("More") {
                    MoreChartsUIView()
                }
            }
        }
    }
}

struct ChartsUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsUIView()
    }
}
