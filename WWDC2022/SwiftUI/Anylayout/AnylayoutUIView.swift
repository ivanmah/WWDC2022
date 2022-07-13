//
//  AnylayoutUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 13/7/22.
//

import SwiftUI

struct AnylayoutUIView: View {
    
    //horizontalSizeClasses measure the horizontal space
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @State private var toggleState = false
    
    var body: some View {
//        let layout = horizontalSizeClass == .regular ? AnyLayout(HStack()) : AnyLayout(VStack())
//        let layout = dynamicTypeSize <=  .xLarge ? AnyLayout(HStack()) : AnyLayout(VStack())
        let layout = toggleState ? AnyLayout(HStack()) : AnyLayout(VStack())
        
        layout {
            Image(systemName: "1.circle")
            Image(systemName: "2.circle")
            Image(systemName: "3.circle")
            Toggle(isOn: $toggleState) {
                Text("Switch")
            }
        }
    }
}

struct AnylayoutUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnylayoutUIView()
    }
}
