//
//  MoreChartsUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 29/6/22.
//

import SwiftUI
import Charts

struct MoreChartsUIView: View {
    
    struct MonthlyVolume : Identifiable {
        let Month : String
        let Volume : Int
        let EstMinVolume : Int
        let EstMaxVolume : Int
        var id : String {Month}
    }
    
    let data : [MonthlyVolume] = [
        .init(Month: "Jan", Volume: 120, EstMinVolume: 110, EstMaxVolume: 130),
        .init(Month: "Feb", Volume: 130, EstMinVolume: 120, EstMaxVolume: 150),
        .init(Month: "Mar", Volume: 140, EstMinVolume: 130, EstMaxVolume: 160),
        .init(Month: "Apr", Volume: 160, EstMinVolume: 140, EstMaxVolume: 180),
        .init(Month: "May", Volume: 160, EstMinVolume: 140, EstMaxVolume: 170),
        .init(Month: "Jun", Volume: 165, EstMinVolume: 150, EstMaxVolume: 170),
        .init(Month: "Jul", Volume: 170, EstMinVolume: 140, EstMaxVolume: 180),
        .init(Month: "Aug", Volume: 171, EstMinVolume: 150, EstMaxVolume: 180),
        .init(Month: "Sept", Volume: 170, EstMinVolume: 150, EstMaxVolume: 180),
        .init(Month: "Oct", Volume: 174, EstMinVolume: 140, EstMaxVolume: 190),
        .init(Month: "Nov", Volume: 180, EstMinVolume: 170, EstMaxVolume: 200),
        .init(Month: "Dec", Volume: 190, EstMinVolume: 180, EstMaxVolume: 190)
    ]
    var body: some View {
        VStack {
            Section {
                Chart {
                    ForEach(data) { item in
                        AreaMark(x: .value("Month", item.Month), yStart: .value("Est Monthly Min", item.EstMinVolume), yEnd: .value("Est Monthly Max", item.EstMaxVolume)).opacity(0.3)
                        LineMark(x: .value("Month", item.Month), y: .value("Volume", item.Volume))
                    }
                }.chartYScale(domain: 100...200)
            }
            Section {
                Chart {
                    ForEach(data) { item in
                        BarMark(x: .value("Month", item.Month), yStart: .value("Est Monthly Min", item.EstMinVolume), yEnd: .value("Est Monthly Max", item.EstMaxVolume)).opacity(0.3)
                        RectangleMark(x: .value("Month", item.Month), y: .value("Volume", item.Volume),height: 2)
                    }
                }.chartYScale(domain: 100...200)
            }
        }
      
    }
}

struct MoreChartsUIView_Previews: PreviewProvider {
    static var previews: some View {
        MoreChartsUIView()
    }
}
