//
//  DocCSwiftUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 11/8/22.
//

import SwiftUI

//Title

//Quick link to new page

//Swift code sample

//Add Documentation category

//Base docC hosting path and upload to github pages

/// View to showcase DocC documentation
///
/// Add active link to another page ``XcodeUIView``.
/// Creates a view for demo of DocC
///
/// ```swift
///@State private var someText : String
///
///var body : some View {
///     DocCSwiftUIView($someText)
///}
/// ```
struct DocCSwiftUIView: View {
    
    var someText: String!
    
    /// Creates a view to display a text
    /// - Parameter text: the text to be displayed
    init(text: String) {
       someText = text
    }
    
    var body: some View {
        Text(someText)
    }
}

struct DocCSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DocCSwiftUIView(text: "Hello World")
    }
}
