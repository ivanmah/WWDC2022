//
//  DooCDemoSwiftUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 22/8/22.
//

import SwiftUI


/// Demo to show documentation
///
/// Code sample to show how to add documentations
/// Add an active link here to another page ``DocCSwiftUIView``
///
/// Code Snippets here
///
/// ```swift
///var body: Some View {
///     DocCDemoSwiftUIView()
///}
///
/// ```
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
