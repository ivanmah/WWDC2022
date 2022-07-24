//
//  MoreChartsUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 29/6/22.
//

import SwiftUI
import Charts

struct MoreChartsUIView: View {
    
    var body: some View {
        VStack {
            Chart {
                ForEach(monthlySalesData) { item in
                    AreaMark(x: .value("Month", item.Month), yStart: .value("Est Monthly Min", item.EstMinVolume), yEnd: .value("Est Monthly Max", item.EstMaxVolume)).opacity(0.3)
                    LineMark(x: .value("Month", item.Month), y: .value("Volume", item.Volume))
                }
            }.chartYScale(domain: 100...200)
            
            Spacer(minLength: 50.0)
            
            Chart {
                ForEach(monthlySalesData) { item in
                    BarMark(x: .value("Month", item.Month), yStart: .value("Est Monthly Min", item.EstMinVolume), yEnd: .value("Est Monthly Max", item.EstMaxVolume)).opacity(0.3)
                    RectangleMark(x: .value("Month", item.Month), y: .value("Volume", item.Volume),height: 2)
                }
            }.chartYScale(domain: 100...200)
            
            Spacer(minLength: 50.0)
            
            Chart {
                ForEach(monthlySalesData) { item in
                    BarMark(x: .value("Month", item.Month), yStart: .value("Est Monthly Min", item.EstMinVolume), yEnd: .value("Est Monthly Max", item.EstMaxVolume)).opacity(0.3)
                    RectangleMark(x: .value("Month", item.Month), y: .value("Volume", item.Volume),height: 2)
                }.foregroundStyle(.gray.opacity(0.5))
                
                RuleMark(y: .value("Average", totalAvgSales))
                    .annotation(position: .top, alignment: .leading) {
                        Text("Average: \(totalAvgSales, format: .number)")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
            }.chartYScale(domain: 100...200)
        }.navigationTitle("Charts")
    }
}

struct MoreChartsUIView_Previews: PreviewProvider {
    static var previews: some View {
        MoreChartsUIView()
    }
}
