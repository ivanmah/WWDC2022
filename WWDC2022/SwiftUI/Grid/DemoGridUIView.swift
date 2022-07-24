//
//  DemoGridUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 24/7/22.
//

import SwiftUI

struct DemoGridUIView: View {
    var body: some View {
        Text("Demo Grid")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                NavigationLink("More") {
                    GridUIView()
                }
            })
        }
    }
}

struct DemoGridUIView_Previews: PreviewProvider {
    static var previews: some View {
        DemoGridUIView()
    }
}
