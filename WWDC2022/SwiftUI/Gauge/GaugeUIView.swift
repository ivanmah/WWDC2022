//
//  GaugeUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 1/7/22.
//

import SwiftUI

struct GaugeUIView: View {
    
    @State private var value = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("accessoryCircular")
            Gauge(value: value, in: 0...1) {
                Text("Gauge Name")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(.red)
            
            Text("accessoryCircularCapacity")
            Gauge(value: value, in: 0...1) {
                Text("Gauge Name")
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.blue)
            
            Text("accessoryLinear")
            Gauge(value: value, in: 0...1) {
            }
            .gaugeStyle(.accessoryLinear)
            .tint(.teal)
            .opacity(0.7)
            
            Text("accessoryLinearCapacity")
            Gauge(value: value, in: 0...1) {
            }
            .gaugeStyle(.accessoryLinearCapacity)
            .tint(.green)
            .opacity(0.6)
            
            Slider(value: $value)
            
            Text("\(value)")
            
        }
    }
}

struct GaugeUIView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeUIView()
    }
}
