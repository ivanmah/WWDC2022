//
//  ScrollDismissKboardUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 13/7/22.
//

import SwiftUI

struct ScrollViewUIView: View {
    
    @State var text = ""
    
    var body: some View {
        ScrollView {
            TextField("Prompt", text: $text)
            ForEach(0 ..< 50) { index in
                Text("\(index)")
                    .padding()
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .scrollIndicators(.never, axes: .vertical)
    }
}

struct ScrollDismissKboardUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewUIView()
    }
}
