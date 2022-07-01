//
//  GaugeUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 1/7/22.
//

import SwiftUI

struct GaugeUIView: View {
    var body: some View {
        VStack {
            
            Text("accessoryCircular")
            Gauge(value: 40, in: 0...100) {
                Text("Gauge Name")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.red)
            
            Text("accessoryCircularCapacity")
            Gauge(value: 50, in: 0...100) {
                Text("Gauge Name")
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.blue)
            
            Text("accessoryLinear")
            Gauge(value: 60, in: 0...100) {
            }
            .gaugeStyle(.accessoryLinear)
            .tint(.teal)
            .opacity(0.7)
            
            Text("accessoryLinearCapacity")
            Gauge(value: 70, in: 0...100) {
            }
            .gaugeStyle(.accessoryLinearCapacity)
            .tint(.green)
            .opacity(0.6)
            
        }
    }
}

struct GaugeUIView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeUIView()
    }
}
