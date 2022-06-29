//
//  DemoChartsUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 29/6/22.
//

import SwiftUI

struct DemoChartsUIView: View {
    var body: some View {
        Text("Demo Charts")
            .navigationTitle("Charts").toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("More") {
                    ChartsUIView()
                }
            }
        }
    }
}

struct DemoChartsUIView_Previews: PreviewProvider {
    static var previews: some View {
        DemoChartsUIView()
    }
}
