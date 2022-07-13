//
//  BottomSheetUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 7/7/22.
//

import SwiftUI

struct BottomSheetUIView: View {
    
    @State private var showingCredits = false
    
    let heights = stride(from: 0.1, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    
    var body: some View {
        Button("Show Sheet") {
            showingCredits.toggle()
        }
        .sheet(isPresented: $showingCredits) {
            Text("Sheet is presented to you")
//                .presentationDetents([.medium,.large])
//                .presentationDetents([.height(100)])
                .presentationDetents(Set(heights))
        }
    }
}

struct BottomSheetUIView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetUIView()
    }
}
