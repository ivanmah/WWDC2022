//
//  DooCDemoSwiftUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 22/8/22.
//

import SwiftUI

struct DocCDemoSwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("DocC")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("More") {
                        DocCSwiftUIView(text: "Hello guys!")
                    }
                }
            }
    }
}

struct DooCDemoSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DocCDemoSwiftUIView()
    }
}
