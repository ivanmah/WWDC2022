//
//  XcodeUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 1/8/22.
//

import SwiftUI

/// Demo view to showcase xcode 
struct XcodeDemoUIView: View {
    var body: some View {
        Text("Demo Xcode")
            .navigationTitle("Xcode")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("More") {
                        XcodeUIView()
                    }
                }
            }
    }
}

struct XcodeDemoUIView_Previews: PreviewProvider {
    static var previews: some View {
        XcodeDemoUIView()
    }
}
