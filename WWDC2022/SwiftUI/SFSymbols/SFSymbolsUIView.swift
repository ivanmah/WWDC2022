//
//  SFSymbolsUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 13/7/22.
//

import SwiftUI

struct SFSymbolsUIView: View {
    
    @State private var value = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "wifi",variableValue: value)
            Image(systemName: "target",variableValue: value)
            Image(systemName: "ellipsis",variableValue: value)
            Image(systemName: "wave.3.right",variableValue: value)
            Image(systemName: "touchid",variableValue: value)
            Slider(value: $value)
        }
        .font(.system(size: 50))
        .foregroundColor(.mint)
        .padding()
    }
}

struct SFSymbolsUIView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsUIView()
    }
}
