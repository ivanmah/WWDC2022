//
//  ShareLinkUIView.swift
//  WWDC2022
//
//  Created by Chia Wei Zheng Terry on 8/7/22.
//

import SwiftUI

struct ShareLinkUIView: View {
    var body: some View {
        
        VStack(spacing: 50) {
            
            ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
            
            ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
                Label("Learn Swift", systemImage: "swift")
            }
            
            ShareLink("Share DBS", item: URL(string: "https://www.dbs.com.sg")!)
            
//            ShareLink(item: URL(string: "www.dbs.com.sg")!,
//                      preview: SharePreview("DBS is the best digital bank!"))
            
        }
    }
}

struct ShareLinkUIView_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkUIView()
    }
}
